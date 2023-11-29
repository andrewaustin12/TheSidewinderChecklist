//
//  DiluentView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct DiluentView: View {
    @State private var isDilBailPressureCheckChecked = false
    @State private var isDilBailAnalyzedChecked = false
    @State private var isComputerMixSetChecked = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Diluent/Bailout")
                ProgressBarView(progress: Double((350/10) * 9))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Pressure check diluent/bailout cylinders", isOn: $isDilBailPressureCheckChecked)
                        Toggle("Analyze diluent/bailout cylinders", isOn: $isDilBailAnalyzedChecked)
                        Toggle("Configure your computer mixes with your analyzed gases", isOn: $isComputerMixSetChecked)
                        
 
                    } header: {
                        Text("Step 22-")
                    }
                    
                    
                    
                }
                NavigationLink("Next") {
                    TransportView()
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
    DiluentView()
}
