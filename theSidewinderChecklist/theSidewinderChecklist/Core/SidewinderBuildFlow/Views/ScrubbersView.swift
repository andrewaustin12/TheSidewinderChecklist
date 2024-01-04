//
//  ScrubbersView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct ScrubbersView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TitleHeaderView(title: "Scrubbers")
                ProgressBarView(progress: Double((350/10) * 2))
                    .padding(.leading)
                
                Form {
                    Section {
                        Toggle("Fill and pack each cannister with sofnolime", isOn: $build.isCannistersPackedChecked)
                        Toggle("Inspect, clean, and lubricate Cannister O-rings if necessary", isOn: $build.isCannistersOringsInspectedChecked)
                        Toggle("Attach each cannister head ensuring proper tower alignment", isOn: $build.isCannistersTowersAlignedChecked)
                        Toggle("Reset stack time if needed", isOn: $build.isStackTimeResetChecked)
                        
                    } header: {
                        Text("Steps 3-6")
                    }
                    
                }
                NavigationLink("Next") {
                    CounterlungView(build: build)
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
        ScrubbersView(build: Build())
            .modelContainer(for: Build.self)
    }
}
