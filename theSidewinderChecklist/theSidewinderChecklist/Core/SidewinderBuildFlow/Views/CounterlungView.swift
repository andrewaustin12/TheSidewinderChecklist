//
//  CounterlungView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct CounterlungView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Counterlung")
                ProgressBarView(progress: Double((350/10) * 2))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Place counterlung in harness", isOn: $build.isCounterlungInHarnessChecked)
                        Toggle("Inspect, clean, and lubricate Counterlung O-rings if necessary", isOn: $build.isCounterlungOringsInspectedChecked)
                        Toggle("Attach cannisters to counterlung and harness attachment points", isOn: $build.isCannistersAttachedChecked)
                        
                    } header: {
                        Text("Steps 7-9")
                    }
                    
                }
                NavigationLink("Next") {
                    LoopView(build: build)
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
        CounterlungView(build: Build())
            .modelContainer(for: Build.self)
    }
}
