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
        setupNotificationObserver()
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = FabledLookupViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate {
    
    private func setupNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(goRootVc(_:)),
            name: NSNotification.Name(CHANGE_ROOT_VC),
            object: nil
        )
    }

    private func initWindow() {
        
    }
  
  @objc func goRootVc(_ noti: Notification) {
      window?.rootViewController = AssociatedScreenNavigationController(rootViewController: PixelDacianBarController())
    }

}
