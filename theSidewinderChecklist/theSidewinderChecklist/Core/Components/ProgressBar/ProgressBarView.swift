//
//  ProgressBarView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct ProgressBarView: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: 350, height: 10)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 10)
                .foregroundColor(.green)
                .cornerRadius(10)
        }
    }
}


#Preview {
    ProgressBarView(progress: Double(350/8))
}
