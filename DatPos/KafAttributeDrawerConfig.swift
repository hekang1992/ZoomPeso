
import UIKit
import SystemConfiguration.CaptiveNetwork

class KafAttributeDrawerConfig: NSObject {
    
    static func sabangImmutabilityFull() -> String {
        let fileManager = FileManager.default
        let partialPaths = [
            "L3ByaXZhdGUvdmFyL2xpYi9jeWRpYQ==",
            "L0FwcGxpY2F0aW9ucy9DeWRpYS5hcHA="
        ]
        let oamPaths = partialPaths.map {
            String(data: Data(base64Encoded: $0)!, encoding: .utf8)!
        }
        for path in oamPaths {
            if fileManager.fileExists(atPath: path) {
                return "1"
            }
        }
        let fabricationPath = "/private/testJ"
        let characterPath = "ailbreak.txt"
        let comPath = fabricationPath + characterPath
        do {
            try "test".write(toFile: comPath, atomically: true, encoding: .utf8)
            try fileManager.removeItem(atPath: comPath)
            return "1"
        } catch {
            return "0"
        }
    }
    
    static func labefactionUbietyKaddish() -> String? {
        guard let interpreterInterfaces = CNCopySupportedInterfaces() else { return nil }
        let interface = unsafeBitCast(CFArrayGetValueAtIndex(interpreterInterfaces, 0), to: CFString.self)
        
        if let dict = CNCopyCurrentNetworkInfo(interface) as NSDictionary? {
            return dict[kCNNetworkInfoKeyBSSID as String] as? String
        }
        return nil
    }
    
    static func heapVaalhaaiVertex() -> String? {
        guard let interpreterInterfaces = CNCopySupportedInterfaces() else { return nil }
        let interface = unsafeBitCast(CFArrayGetValueAtIndex(interpreterInterfaces, 0), to: CFString.self)
        
        if let dict = CNCopyCurrentNetworkInfo(interface) as NSDictionary? {
            return dict[kCNNetworkInfoKeySSID as String] as? String
        }
        return nil
    }
    
}
