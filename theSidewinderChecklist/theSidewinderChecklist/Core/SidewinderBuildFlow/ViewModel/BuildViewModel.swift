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
        // PreAssembly View 1
        computerViewModel.isComputerOnChecked &&
        computerViewModel.isComputerBatteryChecked &&
        !computerViewModel.computerVolts.isEmpty &&
        computerViewModel.isMonoxInstalledChecked &&
        computerViewModel.isSensorCalibrationAirChecked &&
        !computerViewModel.cell1Air.isEmpty &&
        !computerViewModel.cell2Air.isEmpty &&
        !computerViewModel.cell3Air.isEmpty &&
        
        // PreAssembly View 2
        scrubbersViewModel.isO2CylinderAnalyzedChecked &&
        !scrubbersViewModel.o2CylinderAnalyzed.isEmpty &&
        scrubbersViewModel.isO2CylinderPressureCheckChecked &&
        !scrubbersViewModel.o2CylinderPressure.isEmpty &&
        scrubbersViewModel.isCmfFlowChecked &&
        !scrubbersViewModel.cmfFlow.isEmpty &&
        
        // PreAssembly View 3
        counterlungViewModel.isDilBailPercentLabelChecked &&
        !counterlungViewModel.DilBailAnalyzed.isEmpty &&
        counterlungViewModel.isDilBailPressureCheckChecked &&
        !counterlungViewModel.DilBailPressure.isEmpty &&
        
        // PreAssembly View 4
        loopViewModel.isScrubberFilledChecked &&
        loopViewModel.isCanisterOringsInspectedChecked &&
        loopViewModel.isCanisterClosedLabeledChecked &&
        
        // Assembly Counterlungs View 5
        negativeTestViewModel.isExhaleFittingChecked &&
        negativeTestViewModel.isInhaleFittingChecked &&
        negativeTestViewModel.isCanisterCounterlungConnectedChecked &&
        
        // Assembly Loop View 6
        oxygenViewModel.isMouthpieceInspectedChecked &&
        oxygenViewModel.isHosesMushroomValvedInpectedChecked &&
        oxygenViewModel.isMushroomSealInspectedChecked &&
        oxygenViewModel.isCounterlungConnectedChecked &&
        
        // Assebly Gas Line View 7
        flushViewModel.isAdvToCounterlungChecked &&
        flushViewModel.isFirstStageAttachedChecked &&
        flushViewModel.isOxygenCylinderFittedChecked &&
        
        // Assembly Electronics View 8
        calibrateViewModel.isCellHousingConnectedChecked &&
        
        // Assembly Pos Neg Test View 9
        positiveTestViewModel.isPosTestCompleteChecked &&
        positiveTestViewModel.isNegTestCompleteChecked &&
        
        // Assembly Calibration View
        diluentViewModel.isOxygenFlushCompletedChecked &&
        !diluentViewModel.oxygenFlushPercent.isEmpty &&
        diluentViewModel.isCalibrationCompleteChecked &&
        
        // Assembly Bcd Adv View
        transportViewModel.isAdvBcdConnectedChecked &&
        transportViewModel.isAdvFunctionChecked
        
        print("All Steps Completed: \(allStepsCompleted)")
        return allStepsCompleted
    }
    
    // Add a computed property to get incomplete steps
    var incompleteSteps: [Int] {
        var steps: [Int] = []
        
        if !computerViewModel.isComputerOnChecked { steps.append(1) }
        if !computerViewModel.isComputerBatteryChecked { steps.append(2) }
        if computerViewModel.computerVolts.isEmpty { steps.append(2) }
        if !computerViewModel.isMonoxInstalledChecked { steps.append(3) }
        if !computerViewModel.isSensorCalibrationAirChecked { steps.append(4) }
        if computerViewModel.cell1Air.isEmpty { steps.append(4) }
        if computerViewModel.cell2Air.isEmpty { steps.append(4) }
        if computerViewModel.cell3Air.isEmpty { steps.append(4) }
        if !scrubbersViewModel.isO2CylinderAnalyzedChecked { steps.append(5) }
        if scrubbersViewModel.o2CylinderAnalyzed.isEmpty { steps.append(5) }
        if !scrubbersViewModel.isO2CylinderPressureCheckChecked { steps.append(6) }
        if scrubbersViewModel.o2CylinderPressure.isEmpty { steps.append(6) }
        if !scrubbersViewModel.isCmfFlowChecked { steps.append(7) }
        if scrubbersViewModel.cmfFlow.isEmpty { steps.append(7) }
        if !counterlungViewModel.isDilBailPercentLabelChecked { steps.append(8) }
        if counterlungViewModel.DilBailAnalyzed.isEmpty { steps.append(8) }
        if !counterlungViewModel.isDilBailPressureCheckChecked  { steps.append(9) }
        if counterlungViewModel.DilBailPressure.isEmpty { steps.append(9) }
        if !loopViewModel.isScrubberFilledChecked { steps.append(10) }
        if !loopViewModel.isCanisterOringsInspectedChecked { steps.append(11) }
        if !loopViewModel.isCanisterClosedLabeledChecked { steps.append(12) }
        if !negativeTestViewModel.isExhaleFittingChecked { steps.append(13) }
        if !negativeTestViewModel.isInhaleFittingChecked { steps.append(14) }
        if !negativeTestViewModel.isCanisterCounterlungConnectedChecked { steps.append(15) }
        if !oxygenViewModel.isMouthpieceInspectedChecked { steps.append(16) }
        if !oxygenViewModel.isHosesMushroomValvedInpectedChecked { steps.append(17) }
        if !oxygenViewModel.isMushroomSealInspectedChecked { steps.append(18) }
        if !oxygenViewModel.isCounterlungConnectedChecked { steps.append(19) }
        if !flushViewModel.isAdvToCounterlungChecked { steps.append(20) }
        if !flushViewModel.isFirstStageAttachedChecked { steps.append(21) }
        if !flushViewModel.isOxygenCylinderFittedChecked { steps.append(22) }
        if !calibrateViewModel.isCellHousingConnectedChecked { steps.append(23) }
        if !positiveTestViewModel.isPosTestCompleteChecked { steps.append(24) }
        if !positiveTestViewModel.isNegTestCompleteChecked { steps.append(25) }
        if !diluentViewModel.isOxygenFlushCompletedChecked { steps.append(26) }
        if diluentViewModel.oxygenFlushPercent.isEmpty { steps.append(26) }
        if !diluentViewModel.isCalibrationCompleteChecked { steps.append(27) }
        if !transportViewModel.isAdvBcdConnectedChecked { steps.append(28) }
        if !transportViewModel.isAdvFunctionChecked { steps.append(29) }
        return steps
    }
    
    var completedSteps: [Int] {
        var completed: [Int] = []
        for step in 1...29 {
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
    @Published var isO2CylinderAnalyzedChecked = false
    @Published var o2CylinderAnalyzed = ""
    @Published var isO2CylinderPressureCheckChecked = false
    @Published var o2CylinderPressure = ""
    @Published var isCmfFlowChecked = false
    @Published var cmfFlow = ""
    
}

// ViewModel for Counterlung View
class CounterlungViewModel: ObservableObject {
    @Published var isDilBailPercentLabelChecked = false
    @Published var DilBailAnalyzed = ""
    @Published var isDilBailPressureCheckChecked = false
    @Published var DilBailPressure = ""
    
}

// ViewModel for Loop View
class LoopViewModel: ObservableObject {
    @Published var isScrubberFilledChecked = false
    @Published var isCanisterOringsInspectedChecked = false
    @Published var isCanisterClosedLabeledChecked = false
}

// ViewModel for Negative Test View
class NegativeTestViewModel: ObservableObject {
    @Published var isExhaleFittingChecked = false
    @Published var isInhaleFittingChecked = false
    @Published var isCanisterCounterlungConnectedChecked = false
}

// ViewModel for Oxygen View
class OxygenViewModel: ObservableObject {
    @Published var isMouthpieceInspectedChecked = false
    @Published var isHosesMushroomValvedInpectedChecked = false
    @Published var isMushroomSealInspectedChecked = false
    @Published var isCounterlungConnectedChecked = false
}

// ViewModel for Flush View
class FlushViewModel: ObservableObject {
    @Published var isAdvToCounterlungChecked = false
    @Published var isFirstStageAttachedChecked = false
    @Published var isOxygenCylinderFittedChecked = false
}

// ViewModel for Calibrate View
class CalibrateViewModel: ObservableObject {
    @Published var isCellHousingConnectedChecked = false
}

// ViewModel for Postive Test View
class PositiveTestViewModel: ObservableObject {
    @Published var isPosTestCompleteChecked = false
    @Published var isNegTestCompleteChecked = false
}

// ViewModel for Diluent View
class DiluentViewModel: ObservableObject {
    @Published var isOxygenFlushCompletedChecked = false
    @Published var oxygenFlushPercent = ""
    @Published var isCalibrationCompleteChecked = false
}

// ViewModel for Transport View
class TransportViewModel: ObservableObject {
    @Published var isAdvBcdConnectedChecked = false
    @Published var isAdvFunctionChecked = false
}
