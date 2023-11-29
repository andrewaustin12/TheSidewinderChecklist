//
//  StartView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct StartView: View {
//    @StateObject var appViewModel = AppViewModel()
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack {
                
                Image("sidewinder-app-icon")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .font(.system(size: 200))
            }
            .padding()
                
            NavigationLink {
                ComputerView()
            } label: {
                Text("Begin")
            }
            .modifier(PrimaryButtonModifier())
            .foregroundColor(.white)
            Spacer()
        }
    }
}
#Preview {
    StartView()
}
