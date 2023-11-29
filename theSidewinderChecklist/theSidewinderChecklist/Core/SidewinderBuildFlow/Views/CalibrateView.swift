//
//  CalibrateView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct CalibrateView: View {
    @State private var isComputerCalibratedChecked = false

    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case referenceValue
    }

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Calibrate")
                ProgressBarView(progress: Double((350/10) * 7))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Calibrate O2 in computer if needed. Ensure ambient pressure in the loop first.(Optional)", isOn: $isComputerCalibratedChecked)
                        
 
                    } header: {
                        Text("Step 20")
                    }
                    
                    
                    
                }
                NavigationLink("Next") {
                    PositiveCheckView()
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
    CalibrateView()
}
