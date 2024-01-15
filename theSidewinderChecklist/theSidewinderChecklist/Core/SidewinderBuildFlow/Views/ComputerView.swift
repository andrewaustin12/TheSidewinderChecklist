//
//  ComputerView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct ComputerView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Computer")
                ProgressBarView(progress: Double((350/10) * 0.1))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Turn on computer and verify the battery is above 1.25V", isOn: $build.isComputerBatteryGoodChecked)
                        
                    } header: {
                        Text("Step 1")
                    }
                    
                    Section {
                        Toggle("Record the millivolts from each of the cells  at ambient air (21%) in the linearty chart", isOn: $build.isLinearityCheckAirChecked)
                    } header: {
                        Text("Step 2")
                    }
                    
                    Section {
                        LinearityCheckAirView(build: build)
                    } header: {
                        Text("Linearity Chart")
                    }
                }
                NavigationLink("Next") {
                    ScrubbersView(build: build)
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
        ComputerView(build: Build())
            .modelContainer(for: Build.self)
    }
}

