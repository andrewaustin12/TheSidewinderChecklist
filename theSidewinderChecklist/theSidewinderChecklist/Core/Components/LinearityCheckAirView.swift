//
//  LinearityCheckAirView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 12/21/23.
//

import SwiftUI

struct LinearityCheckAirView: View {
    @ObservedObject var buildViewModel: BuildViewModel
//    @State private var mvAirValues = Array(repeating: "", count: 3)
//    @State private var mvO2Values = Array(repeating: "", count: 3)
//    @State private var mvResults = Array(repeating: "0.0", count: 3)
//    @State private var accuracyValues = Array(repeating: "0.0%", count: 3)
    @State var selectedDivisorIndex: Int
    
    let divisors: [Double]
    
    init(buildViewModel: BuildViewModel) {
        self.buildViewModel = buildViewModel
        self.divisors = Array(stride(from: 0.04, through: 0.50, by: 0.01))
        self.selectedDivisorIndex = self.divisors.firstIndex(of: 0.21) ?? 0
        
        
    }

    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack {
                    Text("") // Placeholder
                        .frame(height: 30)
                    ForEach(0..<3, id: \.self) { index in
                        Text("Cell \(index + 1)")
                            .frame(height: 30)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("mV@Air")
                    ForEach(0..<3, id: \.self) { index in
                        
                        TextField("0.0 mV", text: $buildViewModel.linearityCheckViewModel.mvAirValues[index], onCommit: {
                            // Call the calculateResult function when editing is done
                            calculateResult(for: index)
                        })
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 60, height: 30)
                        .keyboardType(.decimalPad)
                        
                        
                    }
                }
                
                Spacer()
                
                VStack {
                    Menu {
                        Picker("Select Divisor", selection: $selectedDivisorIndex) {
                            ForEach(divisors.indices, id: \.self) { index in
                                Text(String(format: "%.2f", divisors[index])).tag(index)
                            }
                        }
                    } label: {
                        Text(String(format: "÷%.2f", divisors[selectedDivisorIndex]))
                            .foregroundColor(Color.accentColor)
                    }
                    .onChange(of: selectedDivisorIndex) {
                        calculateAllResults()
                    }
                    
                    ForEach(buildViewModel.linearityCheckViewModel.mvResults.indices, id: \.self) { index in
                        Text(buildViewModel.linearityCheckViewModel.mvResults[index])
                            .frame(height: 30)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("mV@O2")
                    ForEach(0..<3, id: \.self) { index in
                        Text("0.0")
                            .frame(height: 30)
                        
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Accuracy")
                    ForEach(0..<3, id: \.self) { index in
                        Text(buildViewModel.linearityCheckViewModel.accuracyValues[index])
                            .frame(height: 30)
                            .bold()
                    }
                }
            }
            .font(.system(size: 14))
        }
    }
    
    func calculateResult(for index: Int) {
        if let value = Double(buildViewModel.linearityCheckViewModel.mvAirValues[index]), value != 0 {
            buildViewModel.linearityCheckViewModel.mvResults[index] = String(format: "%.2f", value / divisors[selectedDivisorIndex])
        } else {
            buildViewModel.linearityCheckViewModel.mvResults[index] = "0.0"
        }
        calculateAccuracy(for: index)
    }
    
    func calculateAccuracy(for index: Int) {
        if let o2Value = Double(buildViewModel.linearityCheckViewModel.mvO2Values[index]), let resultValue = Double(buildViewModel.linearityCheckViewModel.mvResults[index]), resultValue != 0 {
            let accuracy = o2Value / resultValue
            buildViewModel.linearityCheckViewModel.accuracyValues[index] = String(format: "%.1f%%", accuracy * 100)
        } else {
            buildViewModel.linearityCheckViewModel.accuracyValues[index] = "N/A"
        }
    }
    
    func calculateAllResults() {
        for index in buildViewModel.linearityCheckViewModel.mvAirValues.indices {
            calculateResult(for: index)
        }
    }
}

struct LinearityCheckAirView_Previews: PreviewProvider {
    static var previews: some View {
        LinearityCheckAirView(buildViewModel: BuildViewModel())
    }
}
