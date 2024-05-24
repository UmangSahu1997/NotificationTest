//
//  AppDelegate.swift
//  NotificationTest
//
//  Created by Umang Sahu on 16/05/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if launchOptions != nil {
            XX.kString = "Success"
            print("lol")
        }
        let notifications = UNUserNotificationCenter.current()
        notifications.requestAuthorization(options: [.alert,.badge,.sound]) { success, err in
            if success {
                notifications.delegate = self
                print("success")
            }else {
                print("some error")
            }
        }
        application.registerForRemoteNotifications()
        
        if let notificationse = launchOptions?[.remoteNotification] as? [String: AnyObject] {
            XX.kClick = true
            //handleNotification(notification)
        }
        return true
    }

    func handleNotification(_ userInfo: [AnyHashable: Any]) {
           // Handle the notification here
           print("Received notification: \(userInfo)")
       }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .badge, .alert])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //XX.kClick = true
        completionHandler()
    }
}


class XX {
    static var kClick = false
    static var kString = ""
}
