//
//  viewconfig.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/7/23.
//

import UIKit

extension UILabel {
    static func createLabel(font: UIFont,
                            textColor: UIColor,
                            textAlignment: NSTextAlignment) -> UILabel {
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

class DataAddressManager {
    static let shared = DataAddressManager()
    private init() {}
    var currentModel: netModel?
}

class DataLoginManager {
    static let shared = DataLoginManager()
    private init() {}
    var currentModel: netModel?
}
