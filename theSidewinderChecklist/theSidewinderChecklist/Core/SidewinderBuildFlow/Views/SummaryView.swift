//
//  SummaryView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationLink("Finish") {
            MainTabView()
        }
        .font(.title)
        .bold()
        .modifier(PrimaryButtonModifier())
        .foregroundStyle(.white)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                NavigationLink {
                    MainTabView()
                } label: {
                    Image(systemName: "house")
                }
            }
        }
    }
}

#Preview {
    SummaryView()
}
