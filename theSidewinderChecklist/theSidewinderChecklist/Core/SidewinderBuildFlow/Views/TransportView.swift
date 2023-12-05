//
//  TransportView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct TransportView: View {
    @ObservedObject var buildViewModel: BuildViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Transport")
                ProgressBarView(progress: Double((350/10) * 10))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("DSV is closed", isOn: $buildViewModel.transportViewModel.isDsvClosedChecked)
                        Toggle("Insure O2 cylinder is still closed", isOn: $buildViewModel.transportViewModel.isO2closedChecked)
                        Toggle("Computer is clipped and secured", isOn: $buildViewModel.transportViewModel.isComputerSecuredChecked)
                        
 
                    } header: {
                        Text("Step 25-27")
                    }
                    
                    
                    
                }
                NavigationLink("Next") {
                    SummaryView()
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
    TransportView(buildViewModel: BuildViewModel())
}
