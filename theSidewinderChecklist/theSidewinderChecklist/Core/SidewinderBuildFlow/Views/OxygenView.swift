//
//  OxygenView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct OxygenView: View {
    @State private var isOxygenTankPressureChecked = false
    @State private var isOxygenTankAnalyzedChecked = false
    @State private var isOxygenTankAttachedChecked = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Oxygen")
                ProgressBarView(progress: Double((350/10) * 5))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Check the pressure of the O2 cylinder", isOn: $isOxygenTankPressureChecked)
                        Toggle("Analyze content of O2 cylinder", isOn: $isOxygenTankAnalyzedChecked)
                        Toggle("Attach cyclinder to harness ensuring correct valve orientation", isOn: $isOxygenTankAttachedChecked)

                        
                    } header: {
                        Text("Steps 15-17")
                    }
                    
                }
                NavigationLink("Next") {
                    FlushView()
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
    OxygenView()
}
