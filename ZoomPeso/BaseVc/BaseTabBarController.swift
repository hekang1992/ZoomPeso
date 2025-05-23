//
//  BaseTabBarController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit

class BaseTabBarController: UITabBarController {
    private let customTabBar = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupCustomTabBar()
        selectedIndex = 0
    }
    
    private func setupViewControllers() {
        let homeVc = HomeViewController()
        let orderVc = OrderViewController()
        let centerVc = CenterViewController()
        self.viewControllers = [homeVc, orderVc, centerVc]
    }
    
    private func setupCustomTabBar() {
        tabBar.isHidden = true
        
        customTabBar.backgroundColor = .clear
        customTabBar.frame = CGRect(
            x: 0,
            y: view.bounds.height - 88,
            width: view.bounds.width,
            height: 88
        )
        view.addSubview(customTabBar)

        let buttonWidth = view.bounds.width / 3
        for i in 0..<3 {
            let button = UIButton(type: .custom)
            button.frame = CGRect(
                x: CGFloat(i) * buttonWidth,
                y: 0,
                width: buttonWidth,
                height: 88
            )
            button.tag = i
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            
            let imageName = i == 0 ? "homesel" : (i == 1 ? "ordernor" : "centernor")
            button.setImage(UIImage(named: imageName), for: .normal)
            button.imageView?.contentMode = .scaleAspectFill
            customTabBar.addSubview(button)
        }
    }
    
    @objc private func tabButtonTapped(_ sender: UIButton) {
        if !IS_VISIBLE_LOGIN {
            let loginVc = BaseNavigationController(rootViewController: LoginViewController())
            loginVc.modalPresentationStyle = .overFullScreen
            self.present(loginVc, animated: true)
            return
        }
        selectedIndex = sender.tag
        updateTabBarButtons()
    }
    
    private func updateTabBarButtons() {
        let buttons = customTabBar.subviews.compactMap { $0 as? UIButton }
        for (index, button) in buttons.enumerated() {
            let isSelected = index == selectedIndex
            let imageName: String
            switch index {
            case 0: imageName = isSelected ? "homesel" : "homenor"
            case 1: imageName = isSelected ? "ordersel" : "ordernor"
            case 2: imageName = isSelected ? "centersel" : "centernor"
            default: imageName = ""
            }
            button.setImage(UIImage(named: imageName), for: .normal)
        }
    }
}
