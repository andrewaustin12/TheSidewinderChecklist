//
//  PositiveCheckView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct PositiveCheckView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    @State private var selectedTime = 30
    @State private var referenceValue: String = ""
    
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case referenceValue
    }

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Positive Test")
                ProgressBarView(progress: Double((350/10) * 8))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Perform Positive check", isOn: $build.isPosTestCompleteChecked)
            
                        Text("Note: \nWith DSV and OPV closed, fill rebreather with O2. The millivolts should increase, stabilize and hold.")
                        Text("Once stabilized pick one cell and record its mV value as a Starting Reference Value below.")
                        Text("Wait until the timer you choose is complete and compare the resulting mV value to your reference value.")
                        Text("Be sure to close the O2 bottle and inject any remaining O2 in the line.")
                            .foregroundStyle(.unitPrimaryForeground)
                        
                        
                    } header: {
                        Text("Step 21")
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
                    DiluentView(build: build)
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
    NavigationStack {
        PositiveCheckView(build: Build())
            .modelContainer(for: Build.self)
    }
}
