//
//  LinearityCheckO2View.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 12/21/23.
//

import SwiftUI

//
//  LinearityCheckView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 12/14/23.
//

import SwiftUI

struct LinearityCheckO2View: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext

    @State var selectedDivisorIndex: Int
    
    let divisors: [Double]
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case mvO2Values
    }
    
    init(build: Build) {
        self.build = build
        self.divisors = Array(stride(from: 0.04, through: 0.50, by: 0.01))
        self.selectedDivisorIndex = self.divisors.firstIndex(of: 0.21) ?? 0
    }

    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack {
                    Text("") // Placeholder
                        .frame(height: 25)
                    ForEach(0..<3, id: \.self) { index in
                        Text("Cell \(index + 1)")
                            .frame(width: 60, height: 30)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("mV@Air")
                    ForEach(0..<3, id: \.self) { index in
                        Text(String(format: "%.2f", build.mvAirValues[index]))
                            .frame(width: 60, height: 30)
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
                    
                    ForEach(build.mvResults.indices, id: \.self) { index in
                        Text(String(format: "%.2f", build.mvResults[index])) // Format to display two decimal places
                            .frame(height: 30)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("mV@O2")
                    ForEach(0..<3, id: \.self) { index in
                        
                        TextField("", value: $build.mvO2Values[index],formatter: {
                            let formatter = NumberFormatter()
                            formatter.maximumFractionDigits = 2 // or a higher number
                            return formatter
                        }())
                        .focused($focusedTextField, equals: .mvO2Values)
                        .onSubmit {focusedTextField = nil}
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 60, height: 30)
                        .keyboardType(.decimalPad)
                        .onChange(of: build.mvO2Values[index]) {
                            calculateResult(for: index)
                        }
                        
                    }
                }
            
                
                Spacer()
                
                VStack {
                    Text("Accuracy")
                    ForEach(0..<3, id: \.self) { index in
                        Text(String(format: "%.2f", build.accuracyValues[index]))
                            .frame(height: 30)
                            .bold()
                    }
                }
            }
            .font(.system(size: 14))
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Dismiss") { focusedTextField = nil }
            }
        }
    }
    
    func calculateResult(for index: Int) {
        let value = build.mvAirValues[index]
        build.mvResults[index] = value / divisors[selectedDivisorIndex]
        calculateAccuracy(for: index)
    }

    func calculateAccuracy(for index: Int) {
        let o2Value = build.mvO2Values[index]
        let resultValue = build.mvResults[index]
        
        if resultValue != 0 {
            let accuracy = o2Value / resultValue * 100 // accuracy as a percentage
            build.accuracyValues[index] = accuracy
        } else {
            build.accuracyValues[index] = 0.0 // or some default value if you don't want to use optional
        }
    }


    func calculateAllResults() {
        for index in build.mvAirValues.indices {
            calculateResult(for: index)
        }
    }
}

struct LinearityCheckO2View_Previews: PreviewProvider {
    static var previews: some View {
        LinearityCheckO2View(build: Build())
    }
}

