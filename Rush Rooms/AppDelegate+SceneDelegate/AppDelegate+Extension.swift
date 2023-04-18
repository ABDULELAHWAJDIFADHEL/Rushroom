//
//  AppDelegate+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 29/03/22.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

extension AppDelegate {
  
    internal func keys(){
        
        IQKeyboardManager.shared.enable = true
//        FirebaseApp.configure()
        //        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        GoogleApi.shared.initialiseWithKey("AIzaSyBzk1iAqappPnU_19zmEz4_9A7z8DrP8Yo")
    }
}

extension AppDelegate{
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("DeviceToken: = ",deviceToken)
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("DeviceToken: = ",deviceTokenString)
   
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        let simulaterToken = "Simulaterwalatokenbb55d44bfc4492bd33aac79afeaee474e92c12138e18b021e2326"
        print("SimulatorToken: = ",simulaterToken)
        USER_DEFAULTS.set(simulaterToken, forKey: UD.deviceToken)
        print("Error registering notifications: \(error)",simulaterToken)
    }
    
}

extension AppDelegate {

    //foreground
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        print(userInfo)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        // handler for Push Notifications
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }

        print(userInfo)
        print("didReceiveRemoteNotification")

        completionHandler(UIBackgroundFetchResult.newData)
    }


}
