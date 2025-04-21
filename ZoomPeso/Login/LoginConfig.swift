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
    
    private func saveLoginInfo(from phone: String, token: String) {
        UserDefaults.standard.set(phone, forKey: USER_PHONE)
        UserDefaults.standard.set(token, forKey: LOGINTOKEN)
        UserDefaults.standard.synchronize()
    }
    
    private func deleteLoginInfo() {
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
        let contrivance = IDFAManager.shared.getIDFA() ?? ""
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
    
}

class IDFAManager {
    static let shared = IDFAManager()
    private let serviceName = "com.zoompeso"
    private let accountName = "idfa"
    
    func getIDFA() -> String? {
        if #available(iOS 14, *) {
            return nil
        } else {
            guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else {
                return nil
            }
            return ASIdentifierManager.shared().advertisingIdentifier.uuidString
        }
    }
    
    func getIDFA(completion: @escaping (String?) -> Void) {
        if let cachedIDFA = SAMKeychain.password(forService: serviceName, account: accountName) {
            completion(cachedIDFA)
            return
        }
        
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                DispatchQueue.main.async { [self] in
                    if status == .authorized {
                        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                        SAMKeychain.setPassword(idfa, forService: serviceName, account: accountName)
                        completion(idfa)
                    } else {
                        completion(nil)
                    }
                }
            }
        } else {
            let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
            SAMKeychain.setPassword(idfa, forService: serviceName, account: accountName)
            completion(idfa)
        }
    }
}
