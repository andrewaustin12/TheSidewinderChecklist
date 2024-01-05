//
//  InlineTimer.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct InlineTimer: View {
    @Binding var selectedTime: Int
    @State private var timer: Timer?
    @State private var timeRemaining: Int = 0
    @State private var isTimerRunning: Bool = false
    @State private var showAlert: Bool = false

    var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60

        if minutes > 0 {
            return String(format: "%d:%02d", minutes, seconds)
        } else if seconds > 0 {
            return String(format: "%d seconds", seconds)
        } else {
            return "Time's up!"
        }
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
                    startTimer()
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
                    Text("Time Remaining: \n\(formattedTime)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .overlay(
                            Button(action: {}) {
                                EmptyView()
                            }
                        )
                        
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Negative Test Complete"), message: Text("The countdown timer has finished."), dismissButton: .default(Text("OK")))
        }
    }

    private func startTimer() {
        guard !isTimerRunning else {
            stopTimer()
            return
        }

        timeRemaining = selectedTime
        isTimerRunning = true

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
                showAlert = true
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
    }
}

struct InlineTimer_Previews: PreviewProvider {
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
