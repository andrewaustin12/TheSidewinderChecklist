//
//  LoopView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct LoopView: View {
    @ObservedObject var buildViewModel: BuildViewModel
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Loop")
                ProgressBarView(progress: Double((350/10) * 3))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Inspect mouthpiece for holes or tears", isOn: $buildViewModel.loopViewModel.isMouthpieceInspectedChecked)
                        Toggle("Perform mushroom valve check", isOn: $buildViewModel.loopViewModel.isMushroomValveTestedChecked)
                        Toggle("Inspect, clean and lubricate loop o-rings as needed", isOn: $buildViewModel.loopViewModel.isLoopOringsInspectedChecked)
                        Toggle("Attach loop to towers ensuring correct alignment of DSV", isOn: $buildViewModel.loopViewModel.isLoopAttachedChecked)
                        
                    } header: {
                        Text("Steps 10-13")
                    }
                    
                }
                NavigationLink("Next") {
                    NegativeTestView(buildViewModel: BuildViewModel())
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
    LoopView(buildViewModel: BuildViewModel())
}
