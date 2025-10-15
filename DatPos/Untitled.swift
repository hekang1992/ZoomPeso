
import UIKit
import KRProgressHUD

enum URLParameterParseError: Error {
    case invalidURL
    case noQueryItems
}

class URLParameterParser {
    static func fabricantNondependentDacha(from dachaString: String) throws -> [String: String] {
        guard let url = URL(string: dachaString) else {
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


class ToastManagerConfig {
    static func showToastText(form view: UIView, message: String) {
        KRProgressHUD.showMessage(message)
    }
}
