//
//  AppDelegate.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        NotificationCenter.default.addObserver(self, selector: #selector(goRootVc(_ :)), name: NSNotification.Name(CHANGE_ROOT_VC), object: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LaunchViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

extension AppDelegate {
  
  @objc func goRootVc(_ noti: Notification) {
      window?.rootViewController = BaseNavigationController(rootViewController: BaseTabBarController())
    }
    
    private func familyNameInfo() {
        for family in UIFont.familyNames {
            for name in UIFont.fontNames(forFamilyName: family) {
                print(" - \(name)")
            }
        }
    }
    
}
