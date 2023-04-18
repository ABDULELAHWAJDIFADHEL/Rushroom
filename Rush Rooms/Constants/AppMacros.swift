//
//  AppMacros.swift
//  Helper Class
//
//  Created by Krishanvir on 29/03/22.
//

import Foundation
import UIKit

let MAIN_BUNDLE = Bundle.main
let MAIN_THREAD = Thread.main
let MAIN_SCREEN = UIScreen.main
let CURRENT_DEVICE = UIDevice.current
let APPLICATION = UIApplication.shared
let FILE_MANAGER = FileManager.default
let CURRENT_CALENDAR = Calendar.current
let USER_DEFAULTS = UserDefaults.standard
let KEY_WINDOW = UIApplication.shared.windows
let MAIN_SCREEN_WIDTH = MAIN_SCREEN.bounds.width
let MAIN_SCREEN_HEIGHT = MAIN_SCREEN.bounds.height
let NOTIFICATION_CENTER = NotificationCenter.default
@available(iOS 16.0, *)
let APP_DELEGATE = (APPLICATION.delegate) as! AppDelegate
let SCENE_DELEGATE = UIApplication.shared.connectedScenes.filter{ $0.delegate != nil }.first?.delegate as! SceneDelegate

// Application informations
//let APP_NAME = AppConfig.getAPPName()
let APP_VERSION = MAIN_BUNDLE.object(forInfoDictionaryKey: "CFBundleVersion")
let APP_NAME = "Rush Rooms"


let EN = "en"
let AR = "ar"
