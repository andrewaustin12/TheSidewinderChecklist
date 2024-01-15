//
//  BuildLogs.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 12/31/23.
//

import SwiftUI
import SwiftData
import Charts

struct BuildLogsView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \Build.dateAdded) var builds: [Build]
    @State private var sortOrder: SortOrder = .newestFirst

    enum SortOrder {
        case newestFirst, oldestFirst
    }

    var sortedBuildHistorys: [Build] {
        switch sortOrder {
        case .newestFirst:
            return builds.sorted { $0.dateAdded > $1.dateAdded }
        case .oldestFirst:
            return builds.sorted { $0.dateAdded < $1.dateAdded }
        }
    }

    private func buildNumber(for build: Build) -> Int {
        let sortedBuilds = builds.sorted { $0.dateAdded < $1.dateAdded }
        guard let index = sortedBuilds.firstIndex(where: { $0.dateAdded ==
            build.dateAdded }) else { return -1 }
        return index + 1 // Adding 1 because array indices start at 0
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Build History")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                if builds.count > 1 {
                    CellAccuracyBarChartView(builds: builds)
                } else {
                    ContentUnavailableView(label: {
                        Label("Not Enough Data", systemImage: "chart.xyaxis.line")
                    }, description: {
                        Text("Two or more builds are needed to show charts")
                            .padding()
                    })
                }

                if builds.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Builds", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Complete your first build to see your logs")
                            .padding()
                    })
                } else {
                    Picker("Sort Order", selection: $sortOrder) {
                        Text("Newest First").tag(SortOrder.newestFirst)
                        Text("Oldest First").tag(SortOrder.oldestFirst)
                    }
                    .pickerStyle(.segmented)
                    .padding()

                    List {
                        Section("Recent Builds") {
                            ForEach(sortedBuildHistorys) { build in
                                let buildNum = buildNumber(for: build)
                                NavigationLink(destination: BuildLogDetailView(build: build, buildNumber: buildNum)) {
                                    HStack {
                                        Text("Build #\(buildNum)")
                                        Spacer()
                                        Text(build.dateAdded, format: Date.FormatStyle().month().day())
                                    }
                                }
                            }
                            .onDelete { indexSet in
                                for index in indexSet {
                                    context.delete(sortedBuildHistorys[index])
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


//    .overlay {
//        if builds.isEmpty {
//            ContentUnavailableView(label: {
//                Label("No Builds", systemImage: "list.bullet.rectangle.portrait")
//            }, description: {
//                Text("Complete a build to see your history.")
//            })
//            .offset(y: -60)
//        }
//    }

