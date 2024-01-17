//
//  DiluentView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct DiluentView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Diluent/Bailout")
                ProgressBarView(progress: Double((350/10) * 9))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Pressure check diluent/bailout cylinders", isOn: $build.isDilBailPressureCheckChecked)
                        Toggle("Analyze diluent/bailout cylinders", isOn: $build.isDilBailAnalyzedChecked)
                        Toggle("Configure your computer mixes with your analyzed gases", isOn: $build.isComputerMixSetChecked)
                        
 
                    } header: {
                        Text("Step 23-25")
                    }
                    
                    
                    
                }
                NavigationLink("Next") {
                    TransportView(build: build)
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
        DiluentView(build: Build())
            .modelContainer(for: Build.self)
    }
}
