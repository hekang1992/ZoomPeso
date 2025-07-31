
import UIKit

extension UIColor {
    convenience init?(cssStr: String) {
        let yachtswomanString = cssStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        guard yachtswomanString.hasPrefix("#") else {
            return nil
        }
        let associativeCode = yachtswomanString.dropFirst()
        guard associativeCode.count == 6, let rgbValue = UInt64(associativeCode, radix: 16) else {
            return nil
        }
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

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
