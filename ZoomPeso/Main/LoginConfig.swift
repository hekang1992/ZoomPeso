//
//  LoginConfig.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import Foundation
import DeviceKit
import SAMKeychain
import AdSupport
import AppTrackingTransparency

let USER_PHONE = "recollect"

let LOGINTOKEN = "attachment"

var IS_LOGIN: Bool {
    if let token = UserDefaults.standard.object(forKey: LOGINTOKEN) as? String {
        return !token.isEmpty
    } else {
        return false
    }
}

class LoginConfig: NSObject {
    
    static func saveLoginInfo(from phone: String, token: String) {
        UserDefaults.standard.set(phone, forKey: USER_PHONE)
        UserDefaults.standard.set(token, forKey: LOGINTOKEN)
        UserDefaults.standard.synchronize()
    }
    
    static func deleteLoginInfo() {
        UserDefaults.standard.set("", forKey: USER_PHONE)
        UserDefaults.standard.set("", forKey: LOGINTOKEN)
        UserDefaults.standard.synchronize()
    }
    
}


extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
}

extension LoginConfig {
    
    static func getLoginInfo() -> [String: String] {
        let applied = Bundle.main.releaseVersionNumber ?? ""
        let raw = Device.current.description
        let repeatedly = DeviceIDManager.shared.getDeviceID()
        let saliva = Device.current.systemVersion ?? ""
        let attachment = UserDefaults.standard.object(forKey: LOGINTOKEN) as? String ?? ""
        let contrivance = DeviceIDManager.shared.getIDFA()
        return [
            "applied": applied,
            "raw": raw,
            "repeatedly": repeatedly,
            "saliva": saliva,
            "attachment": attachment,
            "contrivance": contrivance
        ]
    }
    
}

class DeviceIDManager {
    static let shared = DeviceIDManager()
    private let serviceName = "com.zoom.peso"
    private let accountName = "deviceID"
    
    func getDeviceID() -> String {
        if let deviceID = SAMKeychain.password(forService: serviceName, account: accountName) {
            return deviceID
        }
        
        let newDeviceID: String
        if let vendorID = UIDevice.current.identifierForVendor?.uuidString {
            newDeviceID = vendorID
        } else {
            newDeviceID = UUID().uuidString
        }
        
        SAMKeychain.setPassword(newDeviceID, forService: serviceName, account: accountName)
        
        return newDeviceID
    }
    
    func getIDFA() -> String {
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
    
}

class URLQueryConfig {
    static func appendQueryDict(to url: String, parameters: [String: String]) -> String? {
        guard var urlComponents = URLComponents(string: url) else {
            return nil
        }
        let queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
        return urlComponents.url?.absoluteString
    }
}
