//
//  Define.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import Toast_Swift

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

extension Double {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension CGFloat {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}

extension Int {
    func pix() -> CGFloat {
        return CGFloat.init(CGFloat.init(self)/375.0 * SCREEN_WIDTH)
    }
}


class ViewCycleManager {
    
    private static var loadingView: UIView?
    
    static func showLoading() {
        guard let window = keyWindow else { return }
        if loadingView != nil { return }
        
        let backgroundView = UIView(frame: window.bounds)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.45)
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
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

class ToastManagerConfig {
    static func showToastText(form view: UIView, message: String) {
        view.makeToast(message, duration: 2.0, position: .center)
    }
}

class URLParameterParser {
    static func parse(from urlString: String) -> [String: String] {
        guard let url = URL(string: urlString),
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {
            return [:]
        }
        return queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value
        }
    }
}
