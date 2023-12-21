//
//  LeanearityCheckViewModel.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 12/15/23.
//

//import Foundation
//
//import SwiftUI
//
//class LinearityCheckViewModel: ObservableObject {
//    @Published var mvAirValues = Array(repeating: "", count: 3)
//    @Published var mvO2Values = Array(repeating: "", count: 3)
//    @Published var mvResults = Array(repeating: "0.0", count: 3)
//    @Published var accuracyValues = Array(repeating: "0.0%", count: 3)
//    @Published var selectedDivisorIndex: Int = 0
//    let divisors: [Double] = Array(stride(from: 0.04, through: 0.50, by: 0.01))
//
//    init() {
//        selectedDivisorIndex = divisors.firstIndex(of: 0.21) ?? 0
//    }
//
//    func calculateResult(for index: Int) {
//        if let value = Double(mvAirValues[index]), value != 0 {
//            mvResults[index] = String(format: "%.2f", value / divisors[selectedDivisorIndex])
//        } else {
//            mvResults[index] = "0.0"
//        }
//        calculateAccuracy(for: index)
//    }
//
//    func calculateAccuracy(for index: Int) {
//        if let o2Value = Double(mvO2Values[index]), let resultValue = Double(mvResults[index]), resultValue != 0 {
//            let accuracy = o2Value / resultValue
//            accuracyValues[index] = String(format: "%.1f%%", accuracy * 100)
//        } else {
//            accuracyValues[index] = "N/A"
//        }
//    }
//
//    func calculateAllResults() {
//        for index in mvAirValues.indices {
//            calculateResult(for: index)
//        }
//    }
//}
