//
//  NotificationHandler.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 11/29/23.
//

import Foundation
import UserNotifications

class NotificationHandler {
    
    func askPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) {success, error in
            if success {
                print("Access granted")
            } else if let error = error {
                print("DEBUG: Error is : \(error.localizedDescription)")
            }
        }
    }
    
    func sendNotification(date: Date, type: String, title: String, body: String) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.body = body
            content.sound = UNNotificationSound.default

            let timeInterval = date.timeIntervalSinceNow
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }

}

