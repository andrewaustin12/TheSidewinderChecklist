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
            StartView()
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
            Text("dive planning")
                .onAppear{
                    selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "pencil.and.list.clipboard")
                    Text("Planning")
                }.tag(2)
            BuildLogsView()
                .onAppear{
                    selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "tray")
                    Text("Logs")
                }.tag(3)
            SettingsView()
                .onAppear{
                    selectedIndex = 4
                }
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(4)
            
        }
        .navigationBarBackButtonHidden(true)
//        .accentColor(.unitPrimaryForeground)
    }
}


#Preview {
    MainTabView()
}
