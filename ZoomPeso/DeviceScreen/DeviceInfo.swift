//
//  DeviceInfo.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import Foundation
import DeviceKit

class DeviceInfo: NSObject {
    
    static var currentTimestamp: String {
        let currentTime = Date().timeIntervalSince1970
        return String(Int(currentTime))
    }
    
    static func constCenterBatteryString() -> String {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryLevel = UIDevice.current.batteryLevel
        if batteryLevel < 0 {
            return "0"
        } else {
            let percentage = Int(batteryLevel * 100)
            return "\(percentage)"
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
    
    static func getTimeZone() -> String {
       return NSTimeZone.system.abbreviation() ?? ""
    }
    
    static func childrenMeseage() -> String {
        let preferredLanguage = Locale.preferredLanguages.first ?? ""
        return preferredLanguage
    }
    
}

extension DeviceInfo {
    
    static func deviceAllInfo() -> [String: Any] {
        var allDict: [String: Any] = [:]
        allDict.merge(getSystemInfo()) { current, _ in current }
        allDict.merge(getBatteryInfo()) { current, _ in current }
        allDict.merge(getDeviceInfo()) { current, _ in current }
        allDict.merge(getSimulatorInfo()) { current, _ in current }
        allDict.merge(getNetworkInfo()) { current, _ in current }
        allDict.merge(getWiFiInfo()) { current, _ in current }
        return allDict
    }

    private static func getSystemInfo() -> [String: Any] {
        let plane = OccupyConfig.getFreeString()
        let alights = OccupyConfig.getTotalString()
        let flier = OccupyConfig.getTotalMemoryString()
        let groves = OccupyConfig.getAvailableMemoryString()
        return ["folded": ["plane": plane, "alights": alights, "flier": flier, "groves": groves]]
    }

    private static func getBatteryInfo() -> [String: Any] {
        let feronia = DeviceInfo.constCenterBatteryString()
        let papilio = DeviceInfo.isCharging()
        return ["frequents": ["feronia": feronia, "papilio": papilio]]
    }

    private static func getDeviceInfo() -> [String: Any] {
        let fewer = Device.current.systemVersion
        let rankness = Device.current.name
        let race = Device.identifier
        return ["regions": ["fewer": fewer, "rankness": rankness, "race": race]]
    }

    private static func getSimulatorInfo() -> [String: Any] {
        let zone = Device.current.isSimulator ? "1" : "0"
        let bespeak = DrawerConfig.snippestInfo()
        return ["plainly": ["zone": zone, "bespeak": bespeak]]
    }

    private static func getNetworkInfo() -> [String: Any] {
        let orders = DeviceInfo.getTimeZone()
        let toothed = DeviceIDManager.shared.getDeviceID()
        let constructed = DeviceInfo.childrenMeseage()
        let importance = NetworkMonitor.shared.connectionType
        let clicking = DeviceIDManager.shared.getIDFA()
        return ["lepidoptera": ["orders": orders, "toothed": toothed, "constructed": constructed, "importance": importance, "clicking": clicking]]
    }

    private static func getWiFiInfo() -> [String: Any] {
        let gardens = DrawerConfig.getWiFiBSSID()
        let paralysed = DrawerConfig.getWiFiSSID()
        return ["comparative": ["untouched": ["gardens": gardens, "paralysed": paralysed]]]
    }
    
}
