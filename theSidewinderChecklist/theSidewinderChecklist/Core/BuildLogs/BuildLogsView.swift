//
//  BuildLogs.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 12/31/23.
//

import SwiftUI
import SwiftData

struct BuildLogsView: View {
    @Query var builds: [Build]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        List {
            ForEach(builds) { build in
                Text("\(build.date)")
            }
        }
    }
}

#Preview {
    BuildLogsView()
}
