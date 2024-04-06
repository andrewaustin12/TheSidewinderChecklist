//
//  SettingsView.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            
            
            List {
                
                Section {
                    Image("sidewinder-app-icon")
                        .resizable()
                        .frame(width: 320, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
                
                
                Section("Developer") {
                    HStack{
                        Label("Made by:", systemImage: "person")
                        TwitterLink()
                    }
                    NavigationLink(destination: BuyMeACoffeeView()) {
                        Label("Buy me a coffee", systemImage: "mug.fill")
                    }
                    
                    
                    
                }
                
                Section("Support") {
                    Label("Version 1.3", systemImage: "apps.iphone")
                    
                    Label {
                        HStack {
                            Text("Feature Request")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "lightbulb.min")
                            
                    }
                    .onTapGesture {
                        openMail()
                    }
                    Label {
                        HStack {
                            Text("Give Feedback")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "envelope")
                            
                    }
                    .onTapGesture {
                        openMail()
                    }
                    
                    Label {
                        HStack {
                            Text("Follow on Instagram")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "person.2")
                            
                    }
                    .onTapGesture {
                        openInstagramProfile()
                    }
                    Label {
                        HStack {
                            Text("Visit the website")
                            Spacer() // This will push the text and icon to opposite ends
                            Image(systemName: "link") // The link icon
                                .foregroundColor(.blue)
                        }
                    } icon: {
                        Image(systemName: "macbook")
                            
                    }
                    .onTapGesture {
                        openWebsite()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

struct TwitterLink: View {
    var body: some View {
        Button(action: {
            let userName = "andy_austin_dev"
            if let url = URL(string: "twitter://user?screen_name=\(userName)") {
                UIApplication.shared.open(url)
            }
        }) {
            Text("Andy Austin")
        }
    }
}

/// Support Section

func openMail() {
    let email = "theccrchecklists@yahoo.com"
    if let url = URL(string: "mailto:\(email)") {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}


func openInstagramProfile() {
    let userName = "theccrchecklists" // Replace with your Instagram username
    if let url = URL(string: "instagram://user?username=\(userName)"),
       UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url)
    } else {
        // If Instagram app is not installed, open Instagram website in Safari
        if let webURL = URL(string: "https://www.instagram.com/\(userName)") {
            UIApplication.shared.open(webURL)
        }
    }
}


func openWebsite() {
    let websiteURL = URL(string: "https://theccrchecklists.wixsite.com/theccrchecklists")!
    UIApplication.shared.open(websiteURL)
}
