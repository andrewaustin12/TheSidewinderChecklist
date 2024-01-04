//
//  TransportView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct TransportView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Transport")
                ProgressBarView(progress: Double((350/10) * 10))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("DSV is closed", isOn: $build.isDsvClosedChecked)
                        Toggle("Insure O2 cylinder is still closed", isOn: $build.isO2closedChecked)
                        Toggle("Computer is clipped and secured", isOn: $build.isComputerSecuredChecked)
                        
 
                    } header: {
                        Text("Step 25-27")
                    }
                    
                    
                    
                }
                NavigationLink("Next") {
                    SummaryView(build: build)
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
    NavigationStack {
        TransportView(build: Build())
            .modelContainer(for: Build.self)
    }
}
