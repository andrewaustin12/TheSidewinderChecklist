//
//  ScrubbersView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct ScrubbersView: View {
    @State private var isCannistersPackedChecked = false
    @State private var isCannistersOringsInspectedChecked = false
    @State private var isCannistersTowersAlignedChecked = false
    @State private var isStackTimeResetChecked = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Scrubbers")
                ProgressBarView(progress: Double((350/10) * 2))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Fill and pack each cannister with sofnolime", isOn: $isCannistersPackedChecked)
                        Toggle("Inspect, clean, and lubricate Cannister O-rings if necessary", isOn: $isCannistersOringsInspectedChecked)
                        Toggle("Attach each cannister head ensuring proper tower alignment", isOn: $isCannistersTowersAlignedChecked)
                        Toggle("Reset stack time if needed", isOn: $isStackTimeResetChecked)
                        
                    } header: {
                        Text("Steps 3-6")
                    }
                    
                }
                NavigationLink("Next") {
                    CounterlungView()
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
    ScrubbersView()
}
