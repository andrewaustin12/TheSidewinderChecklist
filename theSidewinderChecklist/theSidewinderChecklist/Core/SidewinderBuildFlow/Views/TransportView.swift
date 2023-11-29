//
//  TransportView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct TransportView: View {
    @State private var isDsvClosedChecked = false
    @State private var isO2closedChecked = false
    @State private var isComputerSecuredChecked = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Transport")
                ProgressBarView(progress: Double((350/10) * 10))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("DSV is closed", isOn: $isDsvClosedChecked)
                        Toggle("Insure O2 cylinder is still closed", isOn: $isO2closedChecked)
                        Toggle("Computer is clipped and secured", isOn: $isComputerSecuredChecked)
                        
 
                    } header: {
                        Text("Step 22-24")
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
    TransportView()
}
