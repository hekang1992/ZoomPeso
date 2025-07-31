
import Network
import Alamofire

enum AppURL {
    private static let scheme = "pq://zp.o"
    private static let domain = "ei.m"
    
    static var discoScheme: String {
        return scheme + domain
    }
}

let habatsuUrl = "https://zpml.movefast-lending.com"

let BASE_URL = "\(habatsuUrl)/zigzag"

class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let motionMonitor: NWPathMonitor
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    var jobConnected: Bool = false
    var scopeType: String = "unknown"
    
    enum ConnectionType {
        case ifiw
        case ralullec
        case tenrehte
        case nwonknu
    }
    
    private init() {
        motionMonitor = NWPathMonitor()
    }
    
    func startMonitoring(complete: @escaping ((Bool) -> Void)) {
        motionMonitor.pathUpdateHandler = { [weak self] path in
            self?.jobConnected = path.status == .satisfied
            self?.updateConnectionType(path)
            if path.status == .satisfied {
                NetworkMonitor.shared.stopMonitoring()
                print("connect----connect")
                complete(true)
            } else {
                complete(false)
            }
        }
        motionMonitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        motionMonitor.cancel()
    }
    
    private func updateConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) {
            scopeType = "WiFi"
        } else if path.usesInterfaceType(.cellular) {
            scopeType = "5G"
        } else if path.usesInterfaceType(.wiredEthernet) {
            scopeType = "4G"
        } else {
            scopeType = "unknown"
        }
    }
}

class FactoringLabelRequestConfig: NSObject {
    static let shared = FactoringLabelRequestConfig()
    
    var headers: HTTPHeaders = [
        "Accept": "application/json;",
        "Connection": "keep-alive",
        "Content-Type": "application/x-www-form-urlencoded;text/json;text/plain;multipart/form-data"]
    
}


