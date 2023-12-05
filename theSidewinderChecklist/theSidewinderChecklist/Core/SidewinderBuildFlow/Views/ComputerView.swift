//
//  ComputerView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct ComputerView: View {
    @ObservedObject var buildViewModel: BuildViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Computer")
                ProgressBarView(progress: Double((350/10) * 0.1))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Turn on computer and verify the battery is above 1.25V", isOn: $buildViewModel.computerViewModel.isComputerBatteryGoodChecked)
                        
                    } header: {
                        Text("Step 1")
                    }
                    
                    Section {
                        Toggle("Record the millivolts from each of the cells  at ambient air (21%) in the linearty chart", isOn: $buildViewModel.computerViewModel.isLinearityCheckAirChecked)
                    } header: {
                        Text("Step 2")
                    }
                    
                    Section {
                        Text("Linearity chart here")
                            .foregroundStyle(.unitPrimaryForeground)
                    } header: {
                        Text("Linearity Chart")
                    }
                }
                NavigationLink("Next") {
                    ScrubbersView(buildViewModel: buildViewModel)
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
                }
            }
        }
    }
}

#Preview {
    ComputerView(buildViewModel: BuildViewModel())
}
