//
//  FlushView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct FlushView: View {
    @ObservedObject var buildViewModel: BuildViewModel
    
    @State private var referenceValue: String = ""
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case referenceValue
    }

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Flush")
                ProgressBarView(progress: Double((350/10) * 6))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("With DSV half open, flush the rebreather slowly with O2. Monitor the cells for smooth and even PO2 increases", isOn: $buildViewModel.flushViewModel.isDsvFlushedChecked)
                        
                        Toggle("Record the millivolts from each of the cells with oxygen (1.00) in the linearity chart", isOn: $buildViewModel.flushViewModel.isOxygenMvRecordedChecked)
 
                    } header: {
                        Text("Steps 18-19")
                    }
                    
                    Section {
                        LinearityCheckO2View(buildViewModel: buildViewModel)
                    } header: {
                        Text("Linearity Chart")
                    }
                    
                }
                NavigationLink("Next") {
                    CalibrateView(buildViewModel: buildViewModel)
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
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Dismiss") { focusedTextField = nil }
                    }
                }
            }
        }
    }
}

#Preview {
    FlushView(buildViewModel: BuildViewModel())
}
