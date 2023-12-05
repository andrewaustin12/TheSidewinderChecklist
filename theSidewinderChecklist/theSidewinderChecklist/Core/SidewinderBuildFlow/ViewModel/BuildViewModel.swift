//
//  BuildViewModel.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/30/23.
//


import Foundation

class BuildViewModel: ObservableObject {
    // Computer View Model
    @Published var computerViewModel = ComputerViewModel()
    
    // Scrubbers View Model
    @Published var scrubbersViewModel = ScrubbersViewModel()
    
    // Counterlung View Model
    @Published var counterlungViewModel = CounterlungViewModel()
    
    // Loop View Model
    @Published var loopViewModel = LoopViewModel()
    
    // Negative Test View Model
    @Published var negativeTestViewModel = NegativeTestViewModel()
    
    // Oxygen View Model
    @Published var oxygenViewModel = OxygenViewModel()
    
    // Flush View Model
    @Published var flushViewModel = FlushViewModel()
    
    // Calibrate View Model
    @Published var calibrateViewModel = CalibrateViewModel()
    
    // Positive test View Model
    @Published var positiveTestViewModel = PositiveTestViewModel()
    
    // Diluent View Model
    @Published var diluentViewModel = DiluentViewModel()
    
    // Transport View Model
    @Published var transportViewModel = TransportViewModel()
    
    // Add a computed property to check if all steps are completed
    var areAllStepsCompleted: Bool {
        print("Debugging areAllStepsCompleted")
        
        let allStepsCompleted =
        // Computer View 1
        computerViewModel.isComputerBatteryGoodChecked &&
        computerViewModel.isLinearityCheckAirChecked &&
//        !computerViewModel.cell1Air.isEmpty &&
//        !computerViewModel.cell2Air.isEmpty &&
//        !computerViewModel.cell3Air.isEmpty &&
        
        // Scrubbers View 2
        scrubbersViewModel.isCannistersPackedChecked &&
        scrubbersViewModel.isCannistersOringsInspectedChecked &&
        scrubbersViewModel.isCannistersTowersAlignedChecked &&
        
        // Counterlung View 3
        counterlungViewModel.isCounterlungInHarnessChecked &&
        counterlungViewModel.isCounterlungOringsInspectedChecked &&
        counterlungViewModel.isCannistersAttachedChecked &&
        
        // Loop View 4
        loopViewModel.isMouthpieceInspectedChecked &&
        loopViewModel.isMushroomValveTestedChecked &&
        loopViewModel.isLoopOringsInspectedChecked &&
        loopViewModel.isLoopAttachedChecked &&
        
        // Negative Test View 5
        negativeTestViewModel.isNegativeTestCompletedChecked &&
        
        // Oxygen View 6
        oxygenViewModel.isOxygenTankPressureChecked &&
        oxygenViewModel.isOxygenTankAnalyzedChecked &&
        oxygenViewModel.isOxygenTankAttachedChecked &&
        
        // Flush View 7
        flushViewModel.isDsvFlushedChecked &&
        flushViewModel.isOxygenMvRecordedChecked &&
        
        // Calibration View 8
//        calibrateViewModel.isComputerCalibratedChecked &&
        
        // Positive Test View 9
        positiveTestViewModel.isPosTestCompleteChecked &&
        
        // Diluent View
        diluentViewModel.isDilBailPressureCheckChecked &&
        diluentViewModel.isDilBailAnalyzedChecked &&
        diluentViewModel.isComputerMixSetChecked &&
        
        // Transport View
        transportViewModel.isDsvClosedChecked &&
        transportViewModel.isO2closedChecked &&
        transportViewModel.isComputerSecuredChecked
        
        print("All Steps Completed: \(allStepsCompleted)")
        return allStepsCompleted
    }
    
    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        
        if !computerViewModel.isComputerBatteryGoodChecked { steps.append(1) }
        if !computerViewModel.isLinearityCheckAirChecked { steps.append(2) }
//        if computerViewModel.cell1Air.isEmpty { steps.append(2) }
//        if computerViewModel.cell2Air.isEmpty { steps.append(2) }
//        if computerViewModel.cell3Air.isEmpty { steps.append(2) }
        if !scrubbersViewModel.isCannistersPackedChecked { steps.append(3) }
        if !scrubbersViewModel.isCannistersOringsInspectedChecked { steps.append(4) }
        if !scrubbersViewModel.isCannistersTowersAlignedChecked { steps.append(5) }
        if !counterlungViewModel.isCounterlungInHarnessChecked { steps.append(7) }
        if !counterlungViewModel.isCounterlungOringsInspectedChecked { steps.append(8) }
        if !counterlungViewModel.isCannistersAttachedChecked  { steps.append(9) }
        if !loopViewModel.isMouthpieceInspectedChecked { steps.append(10) }
        if !loopViewModel.isMushroomValveTestedChecked { steps.append(11) }
        if !loopViewModel.isLoopOringsInspectedChecked { steps.append(12) }
        if !loopViewModel.isLoopAttachedChecked { steps.append(13) }
        if !negativeTestViewModel.isNegativeTestCompletedChecked { steps.append(14) }
        if !oxygenViewModel.isOxygenTankPressureChecked { steps.append(15) }
        if !oxygenViewModel.isOxygenTankAnalyzedChecked { steps.append(16) }
        if !oxygenViewModel.isOxygenTankAttachedChecked { steps.append(17) }
        if !flushViewModel.isDsvFlushedChecked { steps.append(18) }
        if !flushViewModel.isOxygenMvRecordedChecked { steps.append(19) }
//        if !calibrateViewModel.isComputerCalibratedChecked { steps.append(23) }
        if !positiveTestViewModel.isPosTestCompleteChecked { steps.append(21) }
        if !diluentViewModel.isDilBailPressureCheckChecked { steps.append(22) }
        if !diluentViewModel.isDilBailAnalyzedChecked { steps.append(23) }
        if !diluentViewModel.isComputerMixSetChecked { steps.append(24) }
        if !transportViewModel.isDsvClosedChecked { steps.append(25) }
        if !transportViewModel.isO2closedChecked { steps.append(26) }
        if !transportViewModel.isComputerSecuredChecked { steps.append(27) }
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


// ViewModel for Computer View
class ComputerViewModel: ObservableObject {
    @Published var isComputerBatteryGoodChecked = false
    @Published var isLinearityCheckAirChecked = false
}

// ViewModel for Scrubbers View
class ScrubbersViewModel: ObservableObject {
    @Published var isCannistersPackedChecked = false
    @Published var isCannistersOringsInspectedChecked = false
    @Published var isCannistersTowersAlignedChecked = false
    @Published var isStackTimeResetChecked = false
    
}

// ViewModel for Counterlung View
class CounterlungViewModel: ObservableObject {
    @Published var isCounterlungInHarnessChecked = false
    @Published var isCounterlungOringsInspectedChecked = false
    @Published var isCannistersAttachedChecked = false
    
}

// ViewModel for Loop View
class LoopViewModel: ObservableObject {
    @Published var isMouthpieceInspectedChecked = false
    @Published var isMushroomValveTestedChecked = false
    @Published var isLoopOringsInspectedChecked = false
    @Published var isLoopAttachedChecked = false
}

// ViewModel for Negative Test View
class NegativeTestViewModel: ObservableObject {
    @Published var isNegativeTestCompletedChecked = false
}

// ViewModel for Oxygen View
class OxygenViewModel: ObservableObject {
    @Published var isOxygenTankPressureChecked = false
    @Published var isOxygenTankAnalyzedChecked = false
    @Published var isOxygenTankAttachedChecked = false
}

// ViewModel for Flush View
class FlushViewModel: ObservableObject {
    @Published var isDsvFlushedChecked = false
    @Published var isOxygenMvRecordedChecked = false
}

// ViewModel for Calibrate View
class CalibrateViewModel: ObservableObject {
    @Published var  isComputerCalibratedChecked = false
}

// ViewModel for Postive Test View
class PositiveTestViewModel: ObservableObject {
    @Published var isPosTestCompleteChecked = false
}

// ViewModel for Diluent View
class DiluentViewModel: ObservableObject {
    @Published var isDilBailPressureCheckChecked = false
    @Published var isDilBailAnalyzedChecked = false
    @Published var isComputerMixSetChecked = false
}

// ViewModel for Transport View
class TransportViewModel: ObservableObject {
    @Published var isDsvClosedChecked = false
    @Published var isO2closedChecked = false
    @Published var isComputerSecuredChecked = false
}
