//
//  LinearityChartAir.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct LinearityChartAir: View {
    var title: String
    var cell1: String
    var cell2: String
    var cell3: String
    
    @State private var selectedValue = 20
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            
            VStack {
                
                
                HStack {
                    Text("Cell 1")
                        .font(.title3)
                    Text("\(cell1) mV")
                    Picker("Select Value", selection: $selectedValue) {
                        ForEach(1..<100) { index in
                            Text(String(format: "%.2f", Double(index)/100.0))
                        }
                    }
                    .pickerStyle(.menu) // Adjust the picker style as needed
                    
                }
                
                
                
                HStack {
                    Text("Cell 2")
                        .font(.headline)
                    Text("\(cell2) mV")
                    Picker("%.21", selection: $selectedValue) {
                        ForEach(1..<100) { index in
                            Text(String(format: "%.2f", Double(index)/100.0))
                        }
                    }
                    .pickerStyle(.menu) // Adjust the picker style as needed
                }
                
                
                
                HStack {
                    Text("Cell 3")
                        .font(.headline)
                    Text("\(cell2) mV")
                    Picker("Select Value", selection: $selectedValue) {
                        ForEach(1..<100) { index in
                            Text(String(format: "%.2f", Double(index)/100.0))
                        }
                    }
                    .pickerStyle(.menu) // Adjust the picker style as needed
                }
                
                
                
                
                
                
                
                
            }
        }
        .padding()
    }
}

#Preview {
    LinearityChartAir(title: "mV@Air", cell1: "45", cell2: "44", cell3: "46")
}
