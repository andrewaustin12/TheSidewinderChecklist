//
//  LoopView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct LoopView: View {
    @State private var isMouthpieceInspectedChecked = false
    @State private var isMushroomValveTestedChecked = false
    @State private var isLoopOringsInspectedChecked = false
    @State private var isLoopAttachedChecked = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Loop")
                ProgressBarView(progress: Double((350/10) * 3))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Inspect mouthpiece for holes or tears", isOn: $isMouthpieceInspectedChecked)
                        Toggle("Perform mushroom valve check", isOn: $isMushroomValveTestedChecked)
                        Toggle("Inspect, clean and lubricate loop o-rings as needed", isOn: $isLoopOringsInspectedChecked)
                        Toggle("Attach loop to towers ensuring correct alignment of DSV", isOn: $isLoopAttachedChecked)
                        
                    } header: {
                        Text("Steps 10-13")
                    }
                    
                }
                NavigationLink("Next") {
                    NegativeTestView()
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
    LoopView()
}
