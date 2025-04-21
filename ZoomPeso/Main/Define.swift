//
//  Define.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit

let ArialBlackFont = "Arial-Black"

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
