//
//  CounterlungView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct CounterlungView: View {
    @ObservedObject var buildViewModel: BuildViewModel
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Counterlung")
                ProgressBarView(progress: Double((350/10) * 2))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Place counterlung in harness", isOn: $buildViewModel.counterlungViewModel.isCounterlungInHarnessChecked)
                        Toggle("Inspect, clean, and lubricate Counterlung O-rings if necessary", isOn: $buildViewModel.counterlungViewModel.isCounterlungOringsInspectedChecked)
                        Toggle("Attach cannisters to counterlung and harness attachment points", isOn: $buildViewModel.counterlungViewModel.isCannistersAttachedChecked)
                        
                    } header: {
                        Text("Steps 7-9")
                    }
                    
                }
                NavigationLink("Next") {
                    LoopView(buildViewModel: buildViewModel)
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
    CounterlungView(buildViewModel: BuildViewModel())
}
