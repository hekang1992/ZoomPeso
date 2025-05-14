//
//  DrawerConfig.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/5/13.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

class DrawerConfig: NSObject {
    
    static func snippestInfo() -> String {
        let fileManager = FileManager.default
        let encodedPaths = [
            "L0FwcGxpY2F0aW9ucy9DeWRpYS5hcHA=",
            "L3ByaXZhdGUvdmFyL2xpYi9jeWRpYQ=="
        ]
        let paths = encodedPaths.map {
            String(data: Data(base64Encoded: $0)!, encoding: .utf8)!
        }
        for path in paths {
            if fileManager.fileExists(atPath: path) {
                return "1"
            }
        }
        let onePath = "/private/testJ"
        let twoPath = "ailbreak.txt"
        let testPath = onePath + twoPath
        do {
            try "test".write(toFile: testPath, atomically: true, encoding: .utf8)
            try fileManager.removeItem(atPath: testPath)
            return "1"
        } catch {
            return "0"
        }
    }
    
    static func getWiFiBSSID() -> String? {
        guard let interfaces = CNCopySupportedInterfaces() else { return nil }
        let interface = unsafeBitCast(CFArrayGetValueAtIndex(interfaces, 0), to: CFString.self)
        
        if let dict = CNCopyCurrentNetworkInfo(interface) as NSDictionary? {
            return dict[kCNNetworkInfoKeyBSSID as String] as? String
        }
        return nil
    }
    
    static func getWiFiSSID() -> String? {
        guard let interfaces = CNCopySupportedInterfaces() else { return nil }
        let interface = unsafeBitCast(CFArrayGetValueAtIndex(interfaces, 0), to: CFString.self)
        
        if let dict = CNCopyCurrentNetworkInfo(interface) as NSDictionary? {
            return dict[kCNNetworkInfoKeySSID as String] as? String
        }
        return nil
    }
    
}
