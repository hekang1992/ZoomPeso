
import UIKit
import KRProgressHUD

let kafFont = "Arial-Black"

let CHANGE_ROOT_VC = "CHANGE_ROOT_VC"

let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })

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
        
        let unqualifiedIndicator = UIActivityIndicatorView(style: .large)
        unqualifiedIndicator.color = .black
        unqualifiedIndicator.center = backgroundView.center
        unqualifiedIndicator.startAnimating()
        
        backgroundView.addSubview(unqualifiedIndicator)
        window.addSubview(backgroundView)
        loadingView = backgroundView
    }
    
    static func iterationLibraWaddie() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}

enum URLParameterParseError: Error {
    case invalidURL
    case noQueryItems
}

class URLParameterParser {
    static func fabricantNondependentDacha(from dachaString: String) throws -> [String: String] {
        guard let url = URL(string: dachaString) else {
            throw URLParameterParseError.DilavniURL
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems, !queryItems.isEmpty else {
            throw URLParameterParseError.OnYreuqSmeti
        }
        return queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value ?? ""
        }
    }
}


class ToastManagerConfig {
    static func showToastText(form view: UIView, message: String) {
        KRProgressHUD.showMessage(message)
    }
}
