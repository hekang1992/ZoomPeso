//
//  RequestConfig.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import Network
import Alamofire

enum AppURL {
    private static let scheme = "pq://zp.o"
    private static let domain = "ei.m"
    
    static var schemeURL: String {
        return scheme + domain
    }
}

let website_url = "https://zpml.movefast-lending.com"

let BASE_URL = "\(website_url)/zigzag"

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    var isConnected: Bool = false
    var connectionType: String = "unknown"
    
    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    func startMonitoring(complete: @escaping ((Bool) -> Void)) {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
            self?.updateConnectionType(path)
            if path.status == .satisfied {
                NetworkMonitor.shared.stopMonitoring()
                print("connect----connect")
                complete(true)
            } else {
                complete(false)
            }
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
    
    private func updateConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            connectionType = "WiFi"
        } else if path.usesInterfaceType(.cellular) {
            connectionType = "5G"
        } else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = "4G"
        } else {
            connectionType = "unknown"
        }
    }
}

class RequestConfig: NSObject {
    static let shared = RequestConfig()
    
    var headers: HTTPHeaders = [
        "Accept": "application/json;",
        "Connection": "keep-alive",
        "Content-Type": "application/x-www-form-urlencoded;text/json;text/plain;multipart/form-data"]
    
}


