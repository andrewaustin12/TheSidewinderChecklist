//
//  OxygenView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct OxygenView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Oxygen")
                ProgressBarView(progress: Double((350/10) * 5))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Check the pressure of the O2 cylinder", isOn: $build.isOxygenTankPressureChecked)
                        Toggle("Analyze content of O2 cylinder", isOn: $build.isOxygenTankAnalyzedChecked)
                        Toggle("Attach cyclinder to harness ensuring correct valve orientation", isOn: $build.isOxygenTankAttachedChecked)

                        
                    } header: {
                        Text("Steps 15-17")
                    }
                    
                }
                NavigationLink("Next") {
                    FlushView(build: build)
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
        OxygenView(build: Build())
            .modelContainer(for: Build.self)
    }
}
