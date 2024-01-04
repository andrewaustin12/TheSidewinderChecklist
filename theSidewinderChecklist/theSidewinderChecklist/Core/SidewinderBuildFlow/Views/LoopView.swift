//
//  LoopView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct LoopView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Loop")
                ProgressBarView(progress: Double((350/10) * 3))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Inspect mouthpiece for holes or tears", isOn: $build.isMouthpieceInspectedChecked)
                        Toggle("Perform mushroom valve check", isOn: $build.isMushroomValveTestedChecked)
                        Toggle("Inspect, clean and lubricate loop o-rings as needed", isOn: $build.isLoopOringsInspectedChecked)
                        Toggle("Attach loop to towers ensuring correct alignment of DSV", isOn: $build.isLoopAttachedChecked)
                        
                    } header: {
                        Text("Steps 10-13")
                    }
                    
                }
                NavigationLink("Next") {
                    NegativeTestView(build: build)
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
        LoopView(build: Build())
            .modelContainer(for: Build.self)
    }
}
