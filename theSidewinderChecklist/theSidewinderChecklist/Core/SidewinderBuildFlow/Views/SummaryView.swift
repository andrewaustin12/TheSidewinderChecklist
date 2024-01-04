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
    
    var body: some View {
        
        VStack {
            if build.areAllStepsCompleted {
                SummaryCard(isComplete: true, step: "All Steps Complete!")
                    .padding(.top)
                    .padding(.bottom)
                
                ScrollView {
                    Text("Summary of Build")
                        .font(.largeTitle)
                    
                    
                    SummaryCellAirReading(title: "mV Reading w/ Air",
                                          cell1: build.mvAirValues[0],
                                          cell2: build.mvAirValues[1],
                                          cell3: build.mvAirValues[2]
                    )
                    SummaryCellO2Card(title: "mV Reading w/ Oxygen",
                                      cell1: build.mvO2Values[0],
                                      cell2: build.mvO2Values[1],
                                      cell3: build.mvO2Values[2]
                    )
                    
                    
                    
                }
                
                
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
        NavigationLink("Finish") {
            MainTabView()
        }
        .onTapGesture {
            modelContext.insert(build)
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
    }
}

#Preview {
    NavigationStack {
        SummaryView(build: Build())
            .modelContainer(for: Build.self)
    }
}
