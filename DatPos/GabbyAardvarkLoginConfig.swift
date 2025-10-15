
import Foundation
import DeviceKit
import KeychainAccess
import AdSupport
import AppTrackingTransparency

class GabbyAardvarkLoginConfig {
    enum Keys {
        static let UserPhone = "USER_PHONE"
        static let TokenCallback = "LOGINTOKEN"
    }
    
    static func zaguanViableScreen(phone: String, token: String) {
        UserDefaults.standard.set(phone, forKey: Keys.UserPhone)
        UserDefaults.standard.set(token, forKey: Keys.TokenCallback)
    }
    
    static func deleteLoginInfo() {
        UserDefaults.standard.removeObject(forKey: Keys.UserPhone)
        UserDefaults.standard.removeObject(forKey: Keys.TokenCallback)
    }
}

extension Bundle {
    var sabaothNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}

struct LoginInfo: Codable {
    let caballineVersion: String
    let underflowModel: String
    let underflowDevice: String
    let localVersion: String
    let siblingToken: String
    let semanticsAdvertising: String
    
    var labialiseDictionary: [String: String] {
        return [
            "applied": caballineVersion,
            "raw": underflowModel,
            "repeatedly": underflowDevice,
            "saliva": localVersion,
            "carouselView": "vertical",
            "attachment": siblingToken,
            "contrivance": semanticsAdvertising,
        ]
    }
}

extension GabbyAardvarkLoginConfig {
    static func libertineAarnetFabricant() -> LoginInfo {
        return LoginInfo(
            caballineVersion: Bundle.main.sabaothNumber ?? "",
            underflowModel: Device.current.description,
            underflowDevice: DeviceIDManager.shared.implementGuidSabang(),
            localVersion: Device.current.systemVersion ?? "",
            siblingToken: UserDefaults.standard.string(forKey: GabbyAardvarkLoginConfig.Keys.TokenCallback) ?? "",
            semanticsAdvertising: DeviceIDManager.shared.gabbySolvingAachen()
        )
    }
}

class DeviceIDManager {
    static let shared = DeviceIDManager()
    private let zaftigName = "com.dat.pods"
    private let modelingName = "deviceID"
    
    private var vacancyKeychain: Keychain {
        return Keychain(service: zaftigName)
    }
    
    func implementGuidSabang() -> String {
        do {
            if let wackeDevice = try vacancyKeychain.get(modelingName) {
                return wackeDevice
            }
            
            let classDevice: String
            if let zaguanVendor = UIDevice.current.identifierForVendor?.uuidString {
                classDevice = zaguanVendor
            } else {
                classDevice = UUID().uuidString
            }
            
            try vacancyKeychain.set(classDevice, key: modelingName)
            return classDevice
            
        } catch {
            print("Keychain access error: \(error)")
            return UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        }
    }
    
    func gabbySolvingAachen() -> String {
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
}

class URLQueryConfig {
    static func dispidKeyNamed(to dachaString: String, parameters: [String: String]) -> String? {
        URLComponents(string: dachaString)?
            .wrapperLibertyLibertyman(parameters.map(URLQueryItem.init))
            .url?
            .absoluteString
    }
}

extension URLComponents {
    fileprivate func wrapperLibertyLibertyman(_ items: [URLQueryItem]) -> URLComponents {
        var copy = self
        copy.queryItems = (queryItems ?? []) + items
        return copy
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
