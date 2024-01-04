//
//  SummaryCellO2Reading.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 1/4/24.
//

import SwiftUI

struct SummaryCellO2Card: View {
    var title: String
    var cell1: String
    var cell2: String
    var cell3: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            HStack{
                VStack{
                    Text("Cell 1")
                        .font(.headline)
                    Text("\(cell1) mV")
                }
                Spacer()
                VStack{
                    Text("Cell 2")
                        .font(.headline)
                    Text("\(cell2) mV")
                }
                Spacer()
                VStack{
                    Text("Cell 3")
                        .font(.headline)
                    Text("\(cell2) mV")
                }
            }
        }
        .padding()
    }
}

#Preview {
    SummaryCellO2Card(title: "mV Readings w/ O2", cell1: "55.2", cell2: "55.2", cell3: "55.2")}
