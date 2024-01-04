
//
//  BuildViewModel.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/30/23.
//


import Foundation
import SwiftData


@Model
class Build {
    var date = Date.now
    var isComputerBatteryGoodChecked = false
    var mvAirValues = Array(repeating: "", count: 3)
    var mvResults = Array(repeating: "0.0", count: 3)
    var isLinearityCheckAirChecked = false
    var isCannistersPackedChecked = false
    var isCannistersOringsInspectedChecked = false
    var isCannistersTowersAlignedChecked = false
    var isStackTimeResetChecked = false
    var isCounterlungInHarnessChecked = false
    var isCounterlungOringsInspectedChecked = false
    var isCannistersAttachedChecked = false
    var isMouthpieceInspectedChecked = false
    var isMushroomValveTestedChecked = false
    var isLoopOringsInspectedChecked = false
    var isLoopAttachedChecked = false
    var isNegativeTestCompletedChecked = false
    var isOxygenTankPressureChecked = false
    var isOxygenTankAnalyzedChecked = false
    var isOxygenTankAttachedChecked = false
    var isDsvFlushedChecked = false
    var isOxygenMvRecordedChecked = false
    var mvO2Values = Array(repeating: "", count: 3)
    var accuracyValues = Array(repeating: "0.0", count: 3)
    var isComputerCalibratedChecked = false
    var isPosTestCompleteChecked = false
    var isDilBailPressureCheckChecked = false
    var isDilBailAnalyzedChecked = false
    var isComputerMixSetChecked = false
    var isDsvClosedChecked = false
    var isO2closedChecked = false
    var isComputerSecuredChecked = false
    
    init(date: Foundation.Date = Date.now, isComputerBatteryGoodChecked: Bool = false, mvAirValues: [String] = Array(repeating: "", count: 3), mvResults: [String] = Array(repeating: "0.0", count: 3), isLinearityCheckAirChecked: Bool = false, isCannistersPackedChecked: Bool = false, isCannistersOringsInspectedChecked: Bool = false, isCannistersTowersAlignedChecked: Bool = false, isStackTimeResetChecked: Bool = false, isCounterlungInHarnessChecked: Bool = false, isCounterlungOringsInspectedChecked: Bool = false, isCannistersAttachedChecked: Bool = false, isMouthpieceInspectedChecked: Bool = false, isMushroomValveTestedChecked: Bool = false, isLoopOringsInspectedChecked: Bool = false, isLoopAttachedChecked: Bool = false, isNegativeTestCompletedChecked: Bool = false, isOxygenTankPressureChecked: Bool = false, isOxygenTankAnalyzedChecked: Bool = false, isOxygenTankAttachedChecked: Bool = false, isDsvFlushedChecked: Bool = false, isOxygenMvRecordedChecked: Bool = false, mvO2Values: [String] = Array(repeating: "", count: 3), accuracyValues: [String] = Array(repeating: "0.0", count: 3), isComputerCalibratedChecked: Bool = false, isPosTestCompleteChecked: Bool = false, isDilBailPressureCheckChecked: Bool = false, isDilBailAnalyzedChecked: Bool = false, isComputerMixSetChecked: Bool = false, isDsvClosedChecked: Bool = false, isO2closedChecked: Bool = false, isComputerSecuredChecked: Bool = false) {
        self.date = date
        self.isComputerBatteryGoodChecked = isComputerBatteryGoodChecked
        self.mvAirValues = mvAirValues
        self.mvResults = mvResults
        self.isLinearityCheckAirChecked = isLinearityCheckAirChecked
        self.isCannistersPackedChecked = isCannistersPackedChecked
        self.isCannistersOringsInspectedChecked = isCannistersOringsInspectedChecked
        self.isCannistersTowersAlignedChecked = isCannistersTowersAlignedChecked
        self.isStackTimeResetChecked = isStackTimeResetChecked
        self.isCounterlungInHarnessChecked = isCounterlungInHarnessChecked
        self.isCounterlungOringsInspectedChecked = isCounterlungOringsInspectedChecked
        self.isCannistersAttachedChecked = isCannistersAttachedChecked
        self.isMouthpieceInspectedChecked = isMouthpieceInspectedChecked
        self.isMushroomValveTestedChecked = isMushroomValveTestedChecked
        self.isLoopOringsInspectedChecked = isLoopOringsInspectedChecked
        self.isLoopAttachedChecked = isLoopAttachedChecked
        self.isNegativeTestCompletedChecked = isNegativeTestCompletedChecked
        self.isOxygenTankPressureChecked = isOxygenTankPressureChecked
        self.isOxygenTankAnalyzedChecked = isOxygenTankAnalyzedChecked
        self.isOxygenTankAttachedChecked = isOxygenTankAttachedChecked
        self.isDsvFlushedChecked = isDsvFlushedChecked
        self.isOxygenMvRecordedChecked = isOxygenMvRecordedChecked
        self.mvO2Values = mvO2Values
        self.accuracyValues = accuracyValues
        self.isComputerCalibratedChecked = isComputerCalibratedChecked
        self.isPosTestCompleteChecked = isPosTestCompleteChecked
        self.isDilBailPressureCheckChecked = isDilBailPressureCheckChecked
        self.isDilBailAnalyzedChecked = isDilBailAnalyzedChecked
        self.isComputerMixSetChecked = isComputerMixSetChecked
        self.isDsvClosedChecked = isDsvClosedChecked
        self.isO2closedChecked = isO2closedChecked
        self.isComputerSecuredChecked = isComputerSecuredChecked
    }
    
    
    // Add a computed property to check if all steps are completed
    var areAllStepsCompleted: Bool {
        print("Debugging areAllStepsCompleted")
        
        let allStepsCompleted =
        // Computer View 1
        isComputerBatteryGoodChecked &&
        isLinearityCheckAirChecked &&
        //        !computerViewModel.cell1Air.isEmpty &&
        //        !computerViewModel.cell2Air.isEmpty &&
        //        !computerViewModel.cell3Air.isEmpty &&
        !mvAirValues[0].isEmpty &&
        !mvAirValues[1].isEmpty &&
        !mvAirValues[2].isEmpty &&
        
        // Scrubbers View 2
        isCannistersPackedChecked &&
        isCannistersOringsInspectedChecked &&
        isCannistersTowersAlignedChecked &&
        
        // Counterlung View 3
        isCounterlungInHarnessChecked &&
        isCounterlungOringsInspectedChecked &&
        isCannistersAttachedChecked &&
        
        // Loop View 4
        isMouthpieceInspectedChecked &&
        isMushroomValveTestedChecked &&
        isLoopOringsInspectedChecked &&
        isLoopAttachedChecked &&
        
        // Negative Test View 5
        isNegativeTestCompletedChecked &&
        
        // Oxygen View 6
        isOxygenTankPressureChecked &&
        isOxygenTankAnalyzedChecked &&
        isOxygenTankAttachedChecked &&
        
        // Flush View 7
        isDsvFlushedChecked &&
        isOxygenMvRecordedChecked &&
        !mvO2Values[0].isEmpty &&
        !mvO2Values[1].isEmpty &&
        !mvO2Values[2].isEmpty &&
        
        // Calibration View 8
        //        calibrateViewModel.isComputerCalibratedChecked &&
        
        // Positive Test View 9
        isPosTestCompleteChecked &&
        
        // Diluent View
        isDilBailPressureCheckChecked &&
        isDilBailAnalyzedChecked &&
        isComputerMixSetChecked &&
        
        // Transport View
        isDsvClosedChecked &&
        isO2closedChecked &&
        isComputerSecuredChecked
        
        print("All Steps Completed: \(allStepsCompleted)")
        return allStepsCompleted
    }
    
    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        
        if !isComputerBatteryGoodChecked { steps.append(1) }
        if !isLinearityCheckAirChecked { steps.append(2) }
        if mvAirValues[0].isEmpty { steps.append(2)}
        if mvAirValues[1].isEmpty { steps.append(2)}
        if mvAirValues[2].isEmpty { steps.append(2)}
        if !isCannistersPackedChecked { steps.append(3) }
        if !isCannistersOringsInspectedChecked { steps.append(4) }
        if !isCannistersTowersAlignedChecked { steps.append(5) }
        if !isCounterlungInHarnessChecked { steps.append(7) }
        if !isCounterlungOringsInspectedChecked { steps.append(8) }
        if !isCannistersAttachedChecked  { steps.append(9) }
        if !isMouthpieceInspectedChecked { steps.append(10) }
        if !isMushroomValveTestedChecked { steps.append(11) }
        if !isLoopOringsInspectedChecked { steps.append(12) }
        if !isLoopAttachedChecked { steps.append(13) }
        if !isNegativeTestCompletedChecked { steps.append(14) }
        if !isOxygenTankPressureChecked { steps.append(15) }
        if !isOxygenTankAnalyzedChecked { steps.append(16) }
        if !isOxygenTankAttachedChecked { steps.append(17) }
        if !isDsvFlushedChecked { steps.append(18) }
        if !isOxygenMvRecordedChecked { steps.append(19) }
        if mvO2Values[0].isEmpty { steps.append(19)}
        if mvO2Values[1].isEmpty { steps.append(19)}
        if mvO2Values[2].isEmpty { steps.append(19)}
        if !isPosTestCompleteChecked { steps.append(21) }
        if !isDilBailPressureCheckChecked { steps.append(22) }
        if !isDilBailAnalyzedChecked { steps.append(23) }
        if !isComputerMixSetChecked { steps.append(24) }
        if !isDsvClosedChecked { steps.append(25) }
        if !isO2closedChecked { steps.append(26) }
        if !isComputerSecuredChecked { steps.append(27) }
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...27 {
            if !incompleteSteps.contains(step) {
                completed.append(step)
            }
        }
        return completed
    }
    
}




//import Foundation
//
//class BuildViewModel: ObservableObject {
//    // Computer View Model
//    @Published var computerViewModel = ComputerViewModel()
//    
//    // Scrubbers View Model
//    @Published var scrubbersViewModel = ScrubbersViewModel()
//    
//    // Counterlung View Model
//    @Published var counterlungViewModel = CounterlungViewModel()
//    
//    // Loop View Model
//    @Published var loopViewModel = LoopViewModel()
//    
//    // Negative Test View Model
//    @Published var negativeTestViewModel = NegativeTestViewModel()
//    
//    // Oxygen View Model
//    @Published var oxygenViewModel = OxygenViewModel()
//    
//    // Flush View Model
//    @Published var flushViewModel = FlushViewModel()
//    
//    // Calibrate View Model
//    @Published var calibrateViewModel = CalibrateViewModel()
//    
//    // Positive test View Model
//    @Published var positiveTestViewModel = PositiveTestViewModel()
//    
//    // Diluent View Model
//    @Published var diluentViewModel = DiluentViewModel()
//    
//    // Transport View Model
//    @Published var transportViewModel = TransportViewModel()
//    
//    // Linearity check View
//    //@Published var linearityCheckViewModel = LinearityCheckViewModel()
//    
////    @Published var linearityCheckO2ViewModel = LinearityCheckO2ViewModel()
////
////    @Published var linearityCheckAirViewModel = LinearityCheckAirViewModel()
//    
//    // Add a computed property to check if all steps are completed
//    var areAllStepsCompleted: Bool {
//        print("Debugging areAllStepsCompleted")
//        
//        let allStepsCompleted =
//        // Computer View 1
//        computerViewModel.isComputerBatteryGoodChecked &&
//        computerViewModel.isLinearityCheckAirChecked &&
////        !computerViewModel.cell1Air.isEmpty &&
////        !computerViewModel.cell2Air.isEmpty &&
////        !computerViewModel.cell3Air.isEmpty &&
//        
//        // Scrubbers View 2
//        scrubbersViewModel.isCannistersPackedChecked &&
//        scrubbersViewModel.isCannistersOringsInspectedChecked &&
//        scrubbersViewModel.isCannistersTowersAlignedChecked &&
//        
//        // Counterlung View 3
//        counterlungViewModel.isCounterlungInHarnessChecked &&
//        counterlungViewModel.isCounterlungOringsInspectedChecked &&
//        counterlungViewModel.isCannistersAttachedChecked &&
//        
//        // Loop View 4
//        loopViewModel.isMouthpieceInspectedChecked &&
//        loopViewModel.isMushroomValveTestedChecked &&
//        loopViewModel.isLoopOringsInspectedChecked &&
//        loopViewModel.isLoopAttachedChecked &&
//        
//        // Negative Test View 5
//        negativeTestViewModel.isNegativeTestCompletedChecked &&
//        
//        // Oxygen View 6
//        oxygenViewModel.isOxygenTankPressureChecked &&
//        oxygenViewModel.isOxygenTankAnalyzedChecked &&
//        oxygenViewModel.isOxygenTankAttachedChecked &&
//        
//        // Flush View 7
//        flushViewModel.isDsvFlushedChecked &&
//        flushViewModel.isOxygenMvRecordedChecked &&
//        
//        // Calibration View 8
////        calibrateViewModel.isComputerCalibratedChecked &&
//        
//        // Positive Test View 9
//        positiveTestViewModel.isPosTestCompleteChecked &&
//        
//        // Diluent View
//        diluentViewModel.isDilBailPressureCheckChecked &&
//        diluentViewModel.isDilBailAnalyzedChecked &&
//        diluentViewModel.isComputerMixSetChecked &&
//        
//        // Transport View
//        transportViewModel.isDsvClosedChecked &&
//        transportViewModel.isO2closedChecked &&
//        transportViewModel.isComputerSecuredChecked
//        
//        print("All Steps Completed: \(allStepsCompleted)")
//        return allStepsCompleted
//    }
//    
//    // Add a computed property to get incomplete steps
//    var incompleteSteps: [Int] {
//        var steps: [Int] = []
//        
//        if !computerViewModel.isComputerBatteryGoodChecked { steps.append(1) }
//        if !computerViewModel.isLinearityCheckAirChecked { steps.append(2) }
////        if computerViewModel.cell1Air.isEmpty { steps.append(2) }
////        if computerViewModel.cell2Air.isEmpty { steps.append(2) }
////        if computerViewModel.cell3Air.isEmpty { steps.append(2) }
//        if !scrubbersViewModel.isCannistersPackedChecked { steps.append(3) }
//        if !scrubbersViewModel.isCannistersOringsInspectedChecked { steps.append(4) }
//        if !scrubbersViewModel.isCannistersTowersAlignedChecked { steps.append(5) }
//        if !counterlungViewModel.isCounterlungInHarnessChecked { steps.append(7) }
//        if !counterlungViewModel.isCounterlungOringsInspectedChecked { steps.append(8) }
//        if !counterlungViewModel.isCannistersAttachedChecked  { steps.append(9) }
//        if !loopViewModel.isMouthpieceInspectedChecked { steps.append(10) }
//        if !loopViewModel.isMushroomValveTestedChecked { steps.append(11) }
//        if !loopViewModel.isLoopOringsInspectedChecked { steps.append(12) }
//        if !loopViewModel.isLoopAttachedChecked { steps.append(13) }
//        if !negativeTestViewModel.isNegativeTestCompletedChecked { steps.append(14) }
//        if !oxygenViewModel.isOxygenTankPressureChecked { steps.append(15) }
//        if !oxygenViewModel.isOxygenTankAnalyzedChecked { steps.append(16) }
//        if !oxygenViewModel.isOxygenTankAttachedChecked { steps.append(17) }
//        if !flushViewModel.isDsvFlushedChecked { steps.append(18) }
//        if !flushViewModel.isOxygenMvRecordedChecked { steps.append(19) }
////        if !calibrateViewModel.isComputerCalibratedChecked { steps.append(23) }
//        if !positiveTestViewModel.isPosTestCompleteChecked { steps.append(21) }
//        if !diluentViewModel.isDilBailPressureCheckChecked { steps.append(22) }
//        if !diluentViewModel.isDilBailAnalyzedChecked { steps.append(23) }
//        if !diluentViewModel.isComputerMixSetChecked { steps.append(24) }
//        if !transportViewModel.isDsvClosedChecked { steps.append(25) }
//        if !transportViewModel.isO2closedChecked { steps.append(26) }
//        if !transportViewModel.isComputerSecuredChecked { steps.append(27) }
//        return steps
//    }
//    
//    var completedSteps: [Int] {
//        var completed: [Int] = []
//        for step in 1...27 {
//            if !incompleteSteps.contains(step) {
//                completed.append(step)
//            }
//        }
//        return completed
//    }
//}
//
//
//// ViewModel for Computer View
//class ComputerViewModel: ObservableObject {
//    @Published var isComputerBatteryGoodChecked = false
//    @Published var isLinearityCheckAirChecked = false
//}
//
//// ViewModel for Scrubbers View
//class ScrubbersViewModel: ObservableObject {
//    @Published var isCannistersPackedChecked = false
//    @Published var isCannistersOringsInspectedChecked = false
//    @Published var isCannistersTowersAlignedChecked = false
//    @Published var isStackTimeResetChecked = false
//    
//}
//
//// ViewModel for Counterlung View
//class CounterlungViewModel: ObservableObject {
//    @Published var isCounterlungInHarnessChecked = false
//    @Published var isCounterlungOringsInspectedChecked = false
//    @Published var isCannistersAttachedChecked = false
//    
//}
//
//// ViewModel for Loop View
//class LoopViewModel: ObservableObject {
//    @Published var isMouthpieceInspectedChecked = false
//    @Published var isMushroomValveTestedChecked = false
//    @Published var isLoopOringsInspectedChecked = false
//    @Published var isLoopAttachedChecked = false
//}
//
//// ViewModel for Negative Test View
//class NegativeTestViewModel: ObservableObject {
//    @Published var isNegativeTestCompletedChecked = false
//}
//
//// ViewModel for Oxygen View
//class OxygenViewModel: ObservableObject {
//    @Published var isOxygenTankPressureChecked = false
//    @Published var isOxygenTankAnalyzedChecked = false
//    @Published var isOxygenTankAttachedChecked = false
//}
//
//// ViewModel for Flush View
//class FlushViewModel: ObservableObject {
//    @Published var isDsvFlushedChecked = false
//    @Published var isOxygenMvRecordedChecked = false
//}
//
//// ViewModel for Calibrate View
//class CalibrateViewModel: ObservableObject {
//    @Published var  isComputerCalibratedChecked = false
//}
//
//// ViewModel for Postive Test View
//class PositiveTestViewModel: ObservableObject {
//    @Published var isPosTestCompleteChecked = false
//}
//
//// ViewModel for Diluent View
//class DiluentViewModel: ObservableObject {
//    @Published var isDilBailPressureCheckChecked = false
//    @Published var isDilBailAnalyzedChecked = false
//    @Published var isComputerMixSetChecked = false
//}
//
//// ViewModel for Transport View
//class TransportViewModel: ObservableObject {
//    @Published var isDsvClosedChecked = false
//    @Published var isO2closedChecked = false
//    @Published var isComputerSecuredChecked = false
//}





