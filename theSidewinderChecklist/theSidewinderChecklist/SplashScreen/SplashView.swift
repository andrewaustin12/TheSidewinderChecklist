//
//  SplashView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI


struct SplashView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image("sidewinder-app-icon")
                .resizable()
                .frame(width: 400,height: 400)
        }
    }
}

#Preview {
    SplashView()
}
