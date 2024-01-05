//
//  ComputerView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct ComputerView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
   
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Computer")
                ProgressBarView(progress: Double((350/10) * 0.1))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Turn on computer and verify the battery is above 1.25V", isOn: $build.isComputerBatteryGoodChecked)
                        
                    } header: {
                        Text("Step 1")
                    }
                    
                    Section {
                        Toggle("Record the millivolts from each of the cells  at ambient air (21%) in the linearty chart", isOn: $build.isLinearityCheckAirChecked)
                    } header: {
                        Text("Step 2")
                    }
                    
                    Section {
                        LinearityCheckAirView(build: build)
                    } header: {
                        Text("Linearity Chart")
                    }
                }
                NavigationLink("Next") {
                    ScrubbersView(build: build)
                }
                .modifier(PrimaryButtonModifier())
                .foregroundColor(.white)
                .padding(.top)
                .padding(.bottom)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            MainTabView()
                        } label: {
                            Image(systemName: "house")
                        }
                    }
                }
            }
        }
    }
}

//struct LinearityCheckAirView: View {
//    @State var build: Build
//    @Environment(\.modelContext) var modelContext
////    @State private var mvAirValues = Array(repeating: "", count: 3)
////    @State private var mvResults = Array(repeating: "0.0", count: 3)
//    @State private var selectedDivisorIndex: Int
//    let divisors: [Double]
//
//    init() {
//        /// Divisors range from 0.17 to 0.30 with steps of 0.01
//        divisors = Array(stride(from: 0.17, through: 0.30, by: 0.01))
//        if let index = divisors.firstIndex(where: { abs($0 - 0.21) < 0.001 }) {
//            selectedDivisorIndex = index /// Set initial value to closest to 0.21
//        } else {
//            selectedDivisorIndex = 0 // Fallback value
//        }
//    }
//
//    var body: some View {
//        VStack(spacing: 20) {
//            HStack {
//                VStack {
//                    Text("") /// Placeholder
//                        .frame(height: 30)
//                    ForEach(0..<3, id: \.self) { index in
//                        Text("Cell \(index + 1)")
//                            .frame(height: 30)
//                    }
//                }
//
//                Spacer()
//
//                VStack {
//                    Text("mV@Air")
//                    ForEach(0..<3, id: \.self) { index in
//                        TextField("0.0 mV", text: $build.mvAirValues[index])
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .frame(width: 60, height: 30)
//                            .keyboardType(.decimalPad)
//                            .onChange(of: build.mvAirValues[index]) {
//                                calculateResult(for: index)
//                            }
//                    }
//                }
//
//                Spacer()
//
//                VStack {
//                    Menu {
//                        Picker("Select Divisor", selection: $selectedDivisorIndex) {
//                            ForEach(divisors.indices, id: \.self) { index in
//                                Text(String(format: "%.2f", divisors[index])).tag(index)
//                            }
//                        }
//                    } label: {
//                        Text(String(format: "÷%.2f", divisors[selectedDivisorIndex]))
//                            .foregroundColor(.blue)
//                    }
//                    .onChange(of: selectedDivisorIndex) {
//                        calculateAllResults()
//                    }
//
//                    ForEach(build.mvResults.indices, id: \.self) { index in
//                        Text(build.mvResults[index])
//                            .frame(height: 30)
//                    }
//                }
//
//                Spacer()
//
//                VStack {
//                    Text("mV@O2")
//                    ForEach(0..<3) { _ in
//                        Text("0.0")
//                            .frame(height: 30)
//                    }
//                }
//
//                Spacer()
//
//                VStack {
//                    Text("Accuracy")
//                    ForEach(0..<3) { _ in
//                        Text("0.0%")
//                            .frame(height: 30)
//                    }
//                }
//            }
//            .font(.system(size: 14))
//        }
//
//    }
//
//    private func calculateResult(for index: Int) {
//        if let value = Double(build.mvAirValues[index]), value != 0 {
//            build.mvResults[index] = String(format: "%.2f", value / divisors[selectedDivisorIndex])
//        } else {
//            build.mvResults[index] = "0.0"
//        }
//    }
//
//    private func calculateAllResults() {
//        for index in build.mvAirValues.indices {
//            calculateResult(for: index)
//        }
//    }
//}

#Preview {
    NavigationStack {
        ComputerView(build: Build())
            .modelContainer(for: Build.self)
    }
}

