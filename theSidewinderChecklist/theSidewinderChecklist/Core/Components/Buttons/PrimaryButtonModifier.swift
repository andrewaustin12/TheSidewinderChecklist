//
//  PrimaryButtonModifier.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.semibold)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(Color(.unitPrimaryForeground))
            .cornerRadius(8)
            .padding(.leading)
            .padding(.trailing)

    }
}

