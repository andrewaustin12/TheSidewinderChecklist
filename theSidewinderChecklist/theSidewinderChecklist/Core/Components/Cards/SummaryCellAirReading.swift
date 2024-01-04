//
//  SummaryCellAirReading.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 1/4/24.
//

import SwiftUI

struct SummaryCellAirReading: View {

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
    SummaryCellAirReading(title: "mV Readings w/ Air:", cell1: ".48", cell2: ".50", cell3: ".49")
}
