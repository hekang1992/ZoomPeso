//
//  Define.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit

let ArialBlackFont = "Arial-Black"

let CHANGE_ROOT_VC = "CHANGE_ROOT_VC"

let LOGINTOKEN = "LOGINTOKEN"
var IS_LOGIN: Bool {
    if let token = UserDefaults.standard.object(forKey: LOGINTOKEN) as? String {
        return !token.isEmpty
    } else {
        return false
    }
}

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
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

}
