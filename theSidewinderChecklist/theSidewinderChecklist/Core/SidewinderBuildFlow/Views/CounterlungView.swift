//
//  CounterlungView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct CounterlungView: View {
    @State private var isCounterlungInHarnessChecked = false
    @State private var isCounterlungOringsInspectedChecked = false
    @State private var isCannistersAttachedChecked = false
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Counterlung")
                ProgressBarView(progress: Double((350/10) * 2))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Place counterlung in harness", isOn: $isCounterlungInHarnessChecked)
                        Toggle("Inspect, clean, and lubricate Counterlung O-rings if necessary", isOn: $isCounterlungOringsInspectedChecked)
                        Toggle("Attach cannisters to counterlung and harness attachment points", isOn: $isCannistersAttachedChecked)
                        
                    } header: {
                        Text("Steps 7-9")
                    }
                    
                }
                NavigationLink("Next") {
                    LoopView()
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
    CounterlungView()
}
