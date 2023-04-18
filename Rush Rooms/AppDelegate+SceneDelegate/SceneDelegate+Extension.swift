//
//  SceneDelegate+Extension.swift
//  Rush Rooms
//
//  Created by Kv on 25/04/22.
//

import Foundation
import UIKit

extension SceneDelegate{
    
    func checkOutLogin(){
        let token = USER_DEFAULTS.string(forKey: UD.jwtToken)
        if token == EMPTY || token == nil{
            Root.Welcome()
        }else{
            Root.Home()
        }
    }
    
    func validateAppStateToLaunch(){
        if USER_DEFAULTS.bool(forKey: UD.appState) == true{
            print("App already launched")
            checkOutLogin()
        }else{
            USER_DEFAULTS.set(true, forKey: UD.appState)
            print("App launched first time")
            Root.Splash()
        }
    }
}
