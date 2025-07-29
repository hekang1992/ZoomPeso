//
//  BaseNavigationController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.isHidden = true
        self.navigationBar.isTranslucent = false
        self.interactivePopGestureRecognizer?.isEnabled = false
    }

}
