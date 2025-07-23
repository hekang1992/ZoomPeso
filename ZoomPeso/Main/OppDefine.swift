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
        view.makeToast(message, duration: 3.0, position: .center)
    }
}

enum URLParameterParseError: Error {
    case invalidURL
    case noQueryItems
}

class URLParameterParser {
    static func parseWithUrl(from urlString: String) throws -> [String: String] {
        guard let url = URL(string: urlString) else {
            throw URLParameterParseError.invalidURL
        }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems, !queryItems.isEmpty else {
            throw URLParameterParseError.noQueryItems
        }
        return queryItems.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value ?? ""
        }
    }
}
