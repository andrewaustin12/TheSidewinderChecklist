//
//  TestInlineTimer.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 4/6/24.
//

import SwiftUI

struct TestInlineTimer: View {
    @Binding var selectedTime: Int
    @State private var timer: Timer?
    @State private var timeRemaining: Int = 0
    @State private var isTimerRunning: Bool = false
    @State private var showAlert: Bool = false
    @State private var expectedEndTime: Date?

    var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return minutes > 0 ? String(format: "%d:%02d", minutes, seconds) : "\(seconds) seconds"
    }

    var body: some View {
        VStack {
            HStack {
                Picker("Select Time", selection: $selectedTime) {
                    Text("30 seconds").tag(30)
                    Text("1 minute").tag(60)
                    Text("5 minutes").tag(300)
                }
                .pickerStyle(SegmentedPickerStyle())

                Button(action: {
                    isTimerRunning ? stopTimer() : startTimer()
                }) {
                    Text(isTimerRunning ? "Stop" : "Start")
                        .foregroundColor(.white)
                        .padding(9)
                        .background(isTimerRunning ? Color.red : Color.green)
                        .cornerRadius(8)
                }
            }
            
            if isTimerRunning {
                VStack {
                    Text("Time Remaining: ")
                        .font(.title)
                    Text("\(formattedTime)")
                        .font(.title)
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Timer Complete"), message: Text("The countdown timer has finished."), dismissButton: .default(Text("OK")))
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            adjustRemainingTime()
        }
    }

    private func startTimer() {
        guard !isTimerRunning else {
            stopTimer()
            return
        }

        timeRemaining = selectedTime
        isTimerRunning = true
        expectedEndTime = Calendar.current.date(byAdding: .second, value: selectedTime, to: Date())

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
                self.showAlert = true
            }
        }
    }
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }

    private func adjustRemainingTime() {
        guard let expectedEndTime = expectedEndTime else { return }

        let currentTime = Date()
        let remaining = Calendar.current.dateComponents([.second], from: currentTime, to: expectedEndTime).second ?? 0

        if remaining > 0 {
            timeRemaining = remaining
        } else {
            timeRemaining = 0
            if isTimerRunning {
                showAlert = true
                isTimerRunning = false
            }
        }
    }
}

struct TestInlineTimer_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    struct ContentView: View {
        @State private var selectedTime = 30
        
        var body: some View {
            VStack {
                InlineTimer(selectedTime: $selectedTime)
                    .padding()
            }
        }
    }
}
