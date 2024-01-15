//
//  CellAccuracyBarChart.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 1/12/24.
//

import SwiftUI
import Charts

struct CellAccuracyBarChartView: View {
    var builds: [Build]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 30) { // Increased spacing for better separation
                ForEach(0..<3, id: \.self) { accuracyIndex in
                    VStack {
                        Text("Cell \(accuracyIndex + 1) Accuracy")
                            .font(.headline)
                            .padding(.vertical)

                        Chart {
                            ForEach(builds.indices, id: \.self) { index in
                                AreaMark(
                                    x: .value("Build", index),
                                    y: .value("Accuracy", builds[index].accuracyValues[accuracyIndex])
                                )
                                .foregroundStyle(Color.green.gradient.opacity(0.7)) // Adjusted opacity for better visibility
                            }
                        }
                        .padding([.leading, .trailing], 10) // Adjusted padding around the chart
                        .frame(width: 350, height: 250) // Adjusted frame size for better readability
                        .chartYScale(domain: 80...101)
                        .chartYAxis {
                            AxisMarks(preset: .extended, position: .leading)
                        }
                        .chartXAxis {
                            AxisMarks(preset: .inset, position: .bottom)
                        }
                    }
                }
            }
        }
        .padding(.horizontal) // Padding for the entire horizontal ScrollView
    }
}







//#Preview {
//    CellAccuracyBarChart()
//}
