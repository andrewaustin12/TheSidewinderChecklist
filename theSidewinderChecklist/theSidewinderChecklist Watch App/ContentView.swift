//
//  ContentView.swift
//  theSidewinderChecklist Watch App
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = true // Set to true when loading, and false when loading is complete

    var body: some View {
        Group {
            if isLoading {
                LoadingView()
            } else {
                // Your main content goes here
                Text("Hello, Watch!")
            }
        }
    }
}

#Preview {
    ContentView()
}
