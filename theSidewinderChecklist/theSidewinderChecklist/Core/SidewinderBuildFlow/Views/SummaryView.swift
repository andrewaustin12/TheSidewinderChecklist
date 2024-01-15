//
//  SummaryView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct SummaryView: View {
    @State var build: Build
    @Environment(\.modelContext) var modelContext
    @State private var navigateToMain = false // State variable for navigation
    
    var body: some View {
        
        VStack {
            if build.areAllStepsCompleted {
                SummaryCard(isComplete: true, step: "All Steps Complete!")
                    .padding(.top)
                    .padding(.bottom)
                
                Text(NSLocalizedString("Sidewinder Checklist Complete", comment: ""))
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Image("celebration")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                    .font(.system(size: 200))
                
                
                
            } else {
                Text("Some steps are not finished:")
                    .font(.title)
                    .bold()
                
                ScrollView {
                    Section {
                        ForEach(build.incompleteSteps, id: \.self) { step in
                            SummaryCard(isComplete: false, step: "Step \(step)")
                        }
                    }
                }
            }
        }
        Button("Finish") {
            addBuildToHistory()
            navigateToMain = true // Set to navigate
        }
        .font(.title)
        .bold()
        .modifier(PrimaryButtonModifier())
        .disabled(!build.areAllStepsCompleted)
        .foregroundColor(build.areAllStepsCompleted ? .white : .disabledBackground)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                NavigationLink {
                    MainTabView()
                } label: {
                    Image(systemName: "house")
                }
            }
        }
        .navigationDestination(isPresented: $navigateToMain) {
            MainTabView() // Destination view
        }
    }
    
    func addBuildToHistory() {
        modelContext.insert(build)
        print("Build inserted into history")
    }
    
}

#Preview {
    NavigationStack {
        SummaryView(build: Build())
            .modelContainer(for: Build.self)
    }
}
