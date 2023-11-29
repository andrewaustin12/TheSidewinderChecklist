//
//  testchart.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct GridView: View {
    let rows = ["Cell 1", "Cell 2", "Cell 3"]
    let columns = ["mV@Air", "%.21", "mV@02", "Accuracy"]

    @State private var textMatrix: [[String]]

    init() {
        // Initialize the textMatrix in the init method
        _textMatrix = State(initialValue: Array(repeating: Array(repeating: "", count: columns.count), count: rows.count))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // Header row
            HStack(spacing: 0) {
                Spacer()
                ForEach(columns, id: \.self) { columnTitle in
                    Text(columnTitle)
                        .fontWeight(.bold)
                        
                        .frame(width: 80, alignment: .center)
                    Spacer()
                }
            }

            // Data rows
            ForEach(rows.indices) { rowIndex in
                HStack(spacing: 0) {
                    Text(self.rows[rowIndex])
                        .fontWeight(.bold)
                        .frame(width: 80, alignment: .leading)

                    ForEach(self.columns.indices) { columnIndex in
                        TextField("", text: self.$textMatrix[rowIndex][columnIndex])
                            .padding(5)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 80, height: nil, alignment: .leading)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        GridView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
