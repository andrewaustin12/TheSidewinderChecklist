//
//  MainTabView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            Text("Build View")
                .onAppear{
                    selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "water.waves")
                    Text("Build")
                }.tag(0)
            
            GearListView()
                .onAppear{
                    selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("Gear")
                }.tag(1)
            Text("Dive Planning")
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "lanyardcard")
                    Text("Planning")
                }.tag(2)
            SettingsView()
                .onAppear{
                    selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(3)
            
        }
        .navigationBarBackButtonHidden(true)
//        .accentColor(.unitPrimaryForeground)
    }
}


#Preview {
    MainTabView()
}
