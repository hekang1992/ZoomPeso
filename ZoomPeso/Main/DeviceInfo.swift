//
//  DeviceInfo.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit
import Foundation
import DeviceKit
import SystemConfiguration.CaptiveNetwork

class DeviceInfo: NSObject {
    
    static func getFreeString() -> String {
        let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        do {
            let values = try fileURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey])
            if let available = values.volumeAvailableCapacityForImportantUsage {
                return String(available)
            }
        } catch {
            print("Error retrieving available disk space: \(error)")
        }
        return "0"
    }
    
    static func getTotalString() -> String {
        let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        do {
            let values = try fileURL.resourceValues(forKeys: [.volumeTotalCapacityKey])
            if let total = values.volumeTotalCapacity {
                return String(total)
            }
        } catch {
            print("Error retrieving total disk space: \(error)")
        }
        return "0"
    }
    
    static func getTotalMemoryString() -> String {
        let totalMemory = ProcessInfo.processInfo.physicalMemory
        return String(totalMemory)
    }
    
    static func getAvailableMemoryString() -> String {
        var stats = vm_statistics64()
        var count = mach_msg_type_number_t(MemoryLayout<vm_statistics64_data_t>.size / MemoryLayout<integer_t>.size)
        
        let hostPort = mach_host_self()
        let result = withUnsafeMutablePointer(to: &stats) {
            $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                host_statistics64(hostPort, HOST_VM_INFO64, $0, &count)
            }
        }
        
        if result != KERN_SUCCESS {
            return "0"
        }
        
        let pageSize = vm_kernel_page_size
        let freeMemory = UInt64(stats.free_count + stats.inactive_count) * UInt64(pageSize)
        
        return String(freeMemory)
    }
    
    static func getBatteryLevelPercentageString() -> String {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryLevel = UIDevice.current.batteryLevel
        if batteryLevel < 0 {
            return "0"
        } else {
            let percentage = Int(batteryLevel * 100)
            return "\(percentage)%"
        }
    }
    
    static func isCharging() -> String {
        UIDevice.current.isBatteryMonitoringEnabled = true
        switch UIDevice.current.batteryState {
        case .charging, .full:
            return String(1)
        case .unplugged, .unknown:
            return String(0)
        @unknown default:
            return String(0)
        }
    }
    
    static func isDeviceJailbroken() -> String {
        let fileManager = FileManager.default
        let paths = [
            "/Applications/Cydia.app",
            "/private/var/lib/cydia",
        ]
        
        for path in paths {
            if fileManager.fileExists(atPath: path) {
                return "1"
            }
        }
        
        let testPath = "/private/testJailbreak.txt"
        do {
            try "test".write(toFile: testPath, atomically: true, encoding: .utf8)
            try fileManager.removeItem(atPath: testPath)
            return "1"
        } catch {
            return "0"
        }
    }
    
    static func getTimeZone() -> String {
        let timeZone = TimeZone.current
        return timeZone.identifier
    }
    
    static func getCurrentLanguage() -> String {
        let languageCode = Locale.current.languageCode ?? "Unknown"
        return languageCode
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

extension DeviceInfo {
    
    ///deviceInfo
   static func deviceAllInfo() -> [String: Any] {
        let plane = DeviceInfo.getFreeString()
        let alights = DeviceInfo.getTotalString()
        let flier = DeviceInfo.getTotalMemoryString()
        let groves = DeviceInfo.getAvailableMemoryString()
        var dict = ["folded": ["plane": "plane",
                               "alights": alights,
                               "flier": flier,
                               "groves": groves]]
        
        let feronia = DeviceInfo.getBatteryLevelPercentageString()
        let papilio = DeviceInfo.isCharging()
        let latteryDict = ["frequents": ["feronia": feronia,
                                         "papilio": papilio]]
        
        let fewer = Device.current.systemVersion
        let rankness = Device.current.name
        let race = Device.identifier
        let osDict = ["regions": ["fewer": fewer, "rankness": rankness, "race": race]]
        
        let zone = Device.current.isSimulator ? "1" : "0"
        let bespeak = DeviceInfo.isDeviceJailbroken()
        let breakDict = ["plainly": ["zone": zone, "bespeak": bespeak]]
        
        let orders = DeviceInfo.getTimeZone()
        let toothed = DeviceIDManager.shared.getDeviceID()
        let constructed = DeviceInfo.getCurrentLanguage()
        let importance = NetworkMonitor.shared.connectionType
        let clicking = DeviceIDManager.shared.getIDFA()
        let zomeDict = ["lepidoptera": ["orders": orders,
                                        "toothed": toothed,
                                        "constructed": constructed,
                                        "importance": importance,
                                        "clicking": clicking]]
        
        let gardens = DeviceInfo.getWiFiBSSID()
        let paralysed = DeviceInfo.getWiFiSSID()
        let wifiDict = ["comparative": ["untouched": ["gardens": gardens,
                                                      "paralysed": paralysed]]]
        
        var allDict: [String: Any] = [:]
        allDict.merge(dict) { current, _ in current }
        allDict.merge(latteryDict) { current, _ in current }
        allDict.merge(osDict) { current, _ in current }
        allDict.merge(breakDict) { current, _ in current }
        allDict.merge(zomeDict) { current, _ in current }
        allDict.merge(wifiDict) { current, _ in current }
        
        return allDict
    }
    
    
}
