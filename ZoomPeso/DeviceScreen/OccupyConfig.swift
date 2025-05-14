//
//  OccupyConfig.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/5/13.
//

import UIKit

class OccupyConfig: NSObject {
    
    static func getFreeString() -> String {
        let fileURL = URL(fileURLWithPath: NSHomeDirectory())
        do {
            let values = try fileURL.resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey])
            if let available = values.volumeAvailableCapacityForImportantUsage {
                return String(available)
            }
        } catch {
            print("Error disk space: \(error)")
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
            print("Error disk space: \(error)")
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
    
    
}
