//
//  theSidewinderChecklistApp.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import SwiftUI
import SwiftData
import StoreKit
//import RevenueCat
//import RevenueCatUI

@main
struct theSidewinderChecklistApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let container: ModelContainer
    
    @StateObject private var store = TipStore()
    
    var body: some Scene {
        WindowGroup {
            WarningView()
                .modelContainer(container)
                .environmentObject(store)
                

        }
    }
    init() {
        NotificationHandler().askPermission()
        let schema = Schema([Build.self, ToDo.self])
        let config = ModelConfiguration("SidewinderChecklist", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        
//        Purchases.logLevel = .debug
//        Purchases.configure(withAPIKey: Secrets.apiKey)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Handle the notification when the app is in the foreground.
        // You can customize the presentation options here.
        completionHandler([.banner, .sound])
    }
}


