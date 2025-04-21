//
//  AppDelegate.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        familyNameInfo()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LaunchViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

extension AppDelegate {
    
    private func familyNameInfo() {
        for family in UIFont.familyNames {
            print("字体族: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print(" - \(name)")
            }
        }
    }
    
}
