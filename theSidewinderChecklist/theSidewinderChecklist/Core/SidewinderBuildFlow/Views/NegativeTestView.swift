//
//  NegativeTestView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct NegativeTestView: View {
    @State private var isNegativeTestCompletedChecked = false
    @State private var selectedTime = 30
    @State private var referenceValue: String = ""
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case referenceValue
    }

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Negative Test")
                ProgressBarView(progress: Double((350/10) * 4))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Perform Negative check", isOn: $isNegativeTestCompletedChecked)
            
                        Text("Note: \nThe millivolts should decend, stabilize and hold. Once they hold, pick a cell and record it as your Starting Reference Value. When timer is complete compare the final mV to your reference value.")
                            
                        
                        
                    } header: {
                        Text("Step 14")
                    }
                    
                    Section {
                        HStack {
                            Text("Starting Reference Value ")
                            TextField("mV", text: $referenceValue)
                                .focused($focusedTextField, equals: .referenceValue)
                                .onSubmit {focusedTextField = nil}
                                .keyboardType(.decimalPad)
                                .frame(width: 80)
                                .padding(5) // Add padding for some spacing
                                .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray)) // Add a gray border
                        }
                    }
                    
                    Section {
                        InlineTimer(selectedTime: $selectedTime)
                    }
                    
                }
                NavigationLink("Next") {
                    OxygenView()
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
    NegativeTestView()
}
