//
//  Define.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit

let ArialBlackFont = "Arial-Black"

let CHANGE_ROOT_VC = "CHANGE_ROOT_VC"

let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })

extension UILabel {
    static func createLabel(font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.font = font
        return label
    }
}

extension UIColor {
    convenience init?(hexStr: String) {
        let hexString = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard hexString.hasPrefix("#") else {
            return nil
        }
        let hexCode = hexString.dropFirst()
        guard hexCode.count == 6, let rgbValue = UInt64(hexCode, radix: 16) else {
            return nil
        }
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

}

class ToastConfig {
    
    private static var loadingView: UIView?
    
    static func showLoading() {
        guard let window = keyWindow else { return }
        if loadingView != nil { return }
        
        let backgroundView = UIView(frame: window.bounds)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        backgroundView.isUserInteractionEnabled = true
        backgroundView.tag = 999
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .darkGray
        indicator.center = backgroundView.center
        indicator.startAnimating()
        
        backgroundView.addSubview(indicator)
        window.addSubview(backgroundView)
        loadingView = backgroundView
    }
    
    static func hideLoading() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}
