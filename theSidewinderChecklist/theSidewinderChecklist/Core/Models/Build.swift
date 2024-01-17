
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
    var id = UUID()
    @Attribute(.unique)var dateAdded: Date = Date.now
    var isComputerBatteryGoodChecked = false
    var mvAirValues = Array(repeating: 0.0, count: 3)
    var mvResults = Array(repeating: 0.0, count: 3)
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
    var isCmfChecked = false
    var isDsvFlushedChecked = false
    var isOxygenMvRecordedChecked = false
    var mvO2Values = Array(repeating: 0.0, count: 3)
    var accuracyValues = Array(repeating: 0.0, count: 3)
    var isComputerCalibratedChecked = false
    var isPosTestCompleteChecked = false
    var isDilBailPressureCheckChecked = false
    var isDilBailAnalyzedChecked = false
    var isComputerMixSetChecked = false
    var isDsvClosedChecked = false
    var isO2closedChecked = false
    var isComputerSecuredChecked = false
    
    init(
        id: UUID = UUID(),
        dateAdded: Date = Date.now,
        isComputerBatteryGoodChecked: Bool = false,
        mvAirValues: [Double] = Array(repeating: 0.0, count: 3),
        mvResults: [Double] = Array(repeating: 0.0, count: 3),
        isLinearityCheckAirChecked: Bool = false,
        isCannistersPackedChecked: Bool = false,
        isCannistersOringsInspectedChecked: Bool = false,
        isCannistersTowersAlignedChecked: Bool = false,
        isStackTimeResetChecked: Bool = false,
        isCounterlungInHarnessChecked: Bool = false,
        isCounterlungOringsInspectedChecked: Bool = false,
        isCannistersAttachedChecked: Bool = false,
        isMouthpieceInspectedChecked: Bool = false,
        isMushroomValveTestedChecked: Bool = false,
        isLoopOringsInspectedChecked: Bool = false,
        isLoopAttachedChecked: Bool = false,
        isNegativeTestCompletedChecked: Bool = false,
        isOxygenTankPressureChecked: Bool = false,
        isOxygenTankAnalyzedChecked: Bool = false,
        isOxygenTankAttachedChecked: Bool = false,
        isCmfChecked: Bool = false,
        isDsvFlushedChecked: Bool = false,
        isOxygenMvRecordedChecked: Bool = false,
        mvO2Values: [Double] = Array(repeating: 0.0, count: 3),
        accuracyValues: [Double] = Array(repeating: 0.0, count: 3),
        isComputerCalibratedChecked: Bool = false,
        isPosTestCompleteChecked: Bool = false,
        isDilBailPressureCheckChecked: Bool = false,
        isDilBailAnalyzedChecked: Bool = false,
        isComputerMixSetChecked: Bool = false,
        isDsvClosedChecked: Bool = false,
        isO2closedChecked: Bool = false,
        isComputerSecuredChecked: Bool = false
    ) {
        self.id = id
        self.dateAdded = dateAdded
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
        self.isCmfChecked = isCmfChecked
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
        mvAirValues[0] != 0.0 &&
        mvAirValues[1] != 0.0 &&
        mvAirValues[2] != 0.0 &&
        
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
        isCmfChecked &&
        isDsvFlushedChecked &&
        isOxygenMvRecordedChecked &&
        mvO2Values[0] != 0.0 &&
        mvO2Values[1] != 0.0 &&
        mvO2Values[2] != 0.0 &&
        
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
        if mvAirValues[0] == 0.0 { steps.append(2)}
        if mvAirValues[1] == 0.0 { steps.append(2)}
        if mvAirValues[2] == 0.0 { steps.append(2)}
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
        if !isCmfChecked { steps.append(18) }
        if !isDsvFlushedChecked { steps.append(19) }
        if !isOxygenMvRecordedChecked { steps.append(20) }
        if mvO2Values[0] == 0.0 { steps.append(20)}
        if mvO2Values[1] == 0.0 { steps.append(20)}
        if mvO2Values[2] == 0.0 { steps.append(20)}
        if !isPosTestCompleteChecked { steps.append(22) }
        if !isDilBailPressureCheckChecked { steps.append(23) }
        if !isDilBailAnalyzedChecked { steps.append(24) }
        if !isComputerMixSetChecked { steps.append(25) }
        if !isDsvClosedChecked { steps.append(26) }
        if !isO2closedChecked { steps.append(27) }
        if !isComputerSecuredChecked { steps.append(28) }
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...28 {
            if !incompleteSteps.contains(step) {
                completed.append(step)
            }
        }
        return completed
    }
    
}





