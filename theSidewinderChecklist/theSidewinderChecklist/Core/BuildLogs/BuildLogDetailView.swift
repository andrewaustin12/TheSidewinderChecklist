//
//  BuildHistoryView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 1/12/24.
//

import SwiftUI

struct BuildLogDetailView: View {
    var build: Build  // Expects a single Build object
    var buildNumber: Int
    
    var body: some View {
        NavigationStack {
            Text("Build Log")
                .font(.title)
                .bold()
                .padding(.bottom, 4)
            
            
            List {
                Section {
                    HStack {
                        Text("Dive # \(buildNumber)")
                        Spacer()
                        Text(build.dateAdded, format: Date.FormatStyle().month().day().year().hour().minute())
                    }
                }
                Section("Cells @ Air") {
                    HStack {
                        ForEach(0..<build.mvAirValues.count, id: \.self) { index in
                            VStack {
                                Text("Cell \(index + 1):")
                                Text(String(format: "%.2f mV", build.mvAirValues[index]))
                            }

                            // Add a Spacer if it's not the last item
                            if index < build.mvAirValues.count - 1 {
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity) // Ensure HStack takes the full available width
                }
                
                Section("Cells % Air") {
                    HStack {
                        ForEach(0..<build.mvResults.count, id: \.self) { index in
                            VStack {
                                Text("Cell \(index + 1):")
                                Text(String(format: "%.2f mV", build.mvResults[index]))
                            }

                            // Add a Spacer if it's not the last item
                            if index < build.mvResults.count - 1 {
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity) // Ensure HStack takes the full available width
                }
                
                Section("Cells @ O2") {
                    HStack {
                        ForEach(0..<build.mvO2Values.count, id: \.self) { index in
                            VStack {
                                Text("Cell \(index + 1):")
                                Text(String(format: "%.2f mV", build.mvO2Values[index]))
                            }

                            // Add a Spacer if it's not the last item
                            if index < build.mvO2Values.count - 1 {
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity) // Ensure HStack takes the full available width
                }
                
                Section("Cells Accuracy") {
                    HStack {
                        ForEach(0..<build.accuracyValues.count, id: \.self) { index in
                            VStack {
                                Text("Cell \(index + 1):")
                                Text(String(format: "%.2f%%", build.accuracyValues[index]))
                            }

                            // Add a Spacer if it's not the last item
                            if index < build.accuracyValues.count - 1 {
                                Spacer()
                            }
                        }
                    }
                    .frame(maxWidth: .infinity) // Ensure HStack takes the full available width
                }
            }
            //.listStyle(.plain)
        }
    }
}


//#Preview {
//    BuildHistoryView()
//}

