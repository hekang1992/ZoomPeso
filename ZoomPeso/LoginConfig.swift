//
//  LoginConfig.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import Foundation
import DeviceKit
import KeychainAccess
import AdSupport
import AppTrackingTransparency

class LoginConfig {
    enum Keys {
        static let userPhone = "USER_PHONE"
        static let loginToken = "LOGINTOKEN"
    }
    
    static func saveLoginInfo(phone: String, token: String) {
        UserDefaults.standard.set(phone, forKey: Keys.userPhone)
        UserDefaults.standard.set(token, forKey: Keys.loginToken)
    }
    
    static func deleteLoginInfo() {
        UserDefaults.standard.removeObject(forKey: Keys.userPhone)
        UserDefaults.standard.removeObject(forKey: Keys.loginToken)
    }
}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}

struct LoginInfo: Codable {
    let appVersion: String
    let deviceModel: String
    let deviceId: String
    let osVersion: String
    let authToken: String
    let advertisingId: String
    
    var toDictionary: [String: String] {
        return [
            "applied": appVersion,
            "raw": deviceModel,
            "login": "1",
            "index": "10",
            "repeatedly": deviceId,
            "saliva": osVersion,
            "main": "1",
            "carouselView": "vertical",
            "attachment": authToken,
            "contrivance": advertisingId,
            "code": "0",
        ]
    }
}

extension LoginConfig {
    static func getLoginInfo() -> LoginInfo {
        return LoginInfo(
            appVersion: Bundle.main.releaseVersionNumber ?? "",
            deviceModel: Device.current.description,
            deviceId: DeviceIDManager.shared.getDeviceID(),
            osVersion: Device.current.systemVersion ?? "",
            authToken: UserDefaults.standard.string(forKey: LoginConfig.Keys.loginToken) ?? "",
            advertisingId: DeviceIDManager.shared.getIDFA()
        )
    }
}

class DeviceIDManager {
    static let shared = DeviceIDManager()
    private let serviceName = "com.zoom.peso"
    private let accountName = "deviceID"
    
    private var keychain: Keychain {
        return Keychain(service: serviceName)
    }
    
    func getDeviceID() -> String {
        do {
            if let deviceID = try keychain.get(accountName) {
                return deviceID
            }
            
            let newDeviceID: String
            if let vendorID = UIDevice.current.identifierForVendor?.uuidString {
                newDeviceID = vendorID
            } else {
                newDeviceID = UUID().uuidString
            }
            
            try keychain.set(newDeviceID, key: accountName)
            return newDeviceID
            
        } catch {
            print("Keychain access error: \(error)")
            // Fallback to generating a new ID if keychain fails
            return UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        }
    }
    
    func getIDFA() -> String {
        // Note: IDFA access requires proper user consent as per App Store guidelines
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
}

class URLQueryConfig {
    static func appendQueryDict(to urlString: String, parameters: [String: String]) -> String? {
        URLComponents(string: urlString)?
            .appendingQueryItems(parameters.map(URLQueryItem.init))
            .url?
            .absoluteString
    }
}

extension URLComponents {
    fileprivate func appendingQueryItems(_ items: [URLQueryItem]) -> URLComponents {
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
