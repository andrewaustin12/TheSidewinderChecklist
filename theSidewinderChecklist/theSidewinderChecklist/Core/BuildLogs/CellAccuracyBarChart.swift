import SwiftUI
import Charts

struct CellAccuracyBarChartView: View {
    var builds: [Build]

    @State private var expirationDate1 = UserDefaults.standard.object(forKey: "expirationDate1") as? Date ?? Date()
    @State private var expirationDate2 = UserDefaults.standard.object(forKey: "expirationDate2") as? Date ?? Date()
    @State private var expirationDate3 = UserDefaults.standard.object(forKey: "expirationDate3") as? Date ?? Date()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 30) {
                ForEach(0..<3, id: \.self) { accuracyIndex in
                    VStack {
                        Text("Cell \(accuracyIndex + 1)")
                            .font(.title3)
                            .bold()
                        
                        VStack(alignment: .leading) {
                            expirationDatePicker(for: accuracyIndex)
                            
                            // Display the latest accuracy value
                            HStack {
                                if let latestAccuracy = latestAccuracy(for: accuracyIndex) {
                                    Text("Latest Accuracy:")
                                    
                                    Text("\(latestAccuracy, specifier: "%.2f")%")
                                        .padding(.leading, 25)
                                }
                            }
                        }

                        Chart {
                            ForEach(builds.indices, id: \.self) { index in
                                AreaMark(
                                    x: .value("Build", index),
                                    y: .value("Accuracy", builds[index].accuracyValues[accuracyIndex])
                                )
                                .foregroundStyle(Color.green.gradient.opacity(0.7))
                            }
                        }
                        .padding([.leading, .trailing], 10)
                        .frame(width: 350, height: 250)
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
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func expirationDatePicker(for cellIndex: Int) -> some View {
        HStack {
            Text("Expiration Date:")
                
            DatePicker(
                "Select Date",
                selection: expirationDateBinding(for: cellIndex),
                displayedComponents: [.date]
            )
            //.padding(.leading, 10)
            .datePickerStyle(.compact)
            .labelsHidden()
            .onChange(of: expirationDateBinding(for: cellIndex).wrappedValue) { newValue in
                saveExpirationDate(newValue, for: cellIndex)
            }
        }
    }
    
    private func expirationDateBinding(for cellIndex: Int) -> Binding<Date> {
        switch cellIndex {
        case 0:
            return $expirationDate1
        case 1:
            return $expirationDate2
        case 2:
            return $expirationDate3
        default:
            return $expirationDate1 // Fallback, should not happen
        }
    }
    
    private func saveExpirationDate(_ date: Date, for cellIndex: Int) {
        let key = "expirationDate\(cellIndex + 1)"
        UserDefaults.standard.set(date, forKey: key)
    }
    
    private func latestAccuracy(for cellIndex: Int) -> Double? {
        // Assuming builds array is sorted and the last element is the most recent
        guard !builds.isEmpty, cellIndex < builds.last!.accuracyValues.count else {
            return nil
        }
        return builds.last!.accuracyValues[cellIndex]
    }
}
