//
//  WarningHeaderView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//
import SwiftUI

struct WarningHeaderView: View {
    let title1: String
    let title2: String
    let title3: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(title3)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

#Preview {
    WarningHeaderView(title1: "The", title2: "Sidewinder", title3: "Checklist")
}
