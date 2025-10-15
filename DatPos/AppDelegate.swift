

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNotificationObserver()
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
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.isEnabled = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        
    }
    
    
    @objc func goRootVc(_ noti: Notification) {
        
        if IS_VISIBLE_LOGIN {
            window?.rootViewController = AssociatedScreenNavigationController(rootViewController: PixelDacianBarController())
        }else {
            let loginVc = ChainHabanaViewController()
            let hierarchyLogin = AssociatedScreenNavigationController(rootViewController: loginVc)
            loginVc.alphabeticallyView.partialBtn.isHidden = true
            window?.rootViewController = hierarchyLogin
        }
    }
    
}
