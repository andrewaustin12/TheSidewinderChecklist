//
//  DiluentView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct DiluentView: View {
    @ObservedObject var buildViewModel: BuildViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Diluent/Bailout")
                ProgressBarView(progress: Double((350/10) * 9))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Pressure check diluent/bailout cylinders", isOn: $buildViewModel.diluentViewModel.isDilBailPressureCheckChecked)
                        Toggle("Analyze diluent/bailout cylinders", isOn: $buildViewModel.diluentViewModel.isDilBailAnalyzedChecked)
                        Toggle("Configure your computer mixes with your analyzed gases", isOn: $buildViewModel.diluentViewModel.isComputerMixSetChecked)
                        
 
                    } header: {
                        Text("Step 22-24")
                    }
                    
                    
                    
                }
                NavigationLink("Next") {
                    TransportView(buildViewModel: buildViewModel)
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
    DiluentView(buildViewModel: BuildViewModel())
}
