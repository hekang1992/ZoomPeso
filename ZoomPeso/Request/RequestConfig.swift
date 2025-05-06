//
//  RequestConfig.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import Network
import Alamofire

enum AppURL {
    private static let scheme = "pq://"
    private static let domain = "zp.oei.m"
    
    static var schemeURL: String {
        return scheme + domain
    }
}

let BASE_URL = "http://47.84.36.196:8235/zigzag"

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
                print("lose----lose")
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
        "Content-Type": "application/x-www-form-urlencoded;text/json;text/javascript;text/html;text/plain;multipart/form-data"]
    
}

class NetworkManager {
    
    static func getRequest<T: Decodable>(endpoint: String,
                                         parameters: Parameters? = nil,
                                         responseType: T.Type,
                                         completion: @escaping (Result<T, Error>) -> Void) {
        
        let loginDict = LoginConfig.getLoginInfo().toDictionary
        let url = URLQueryConfig.appendQueryDict(to: BASE_URL + endpoint, parameters: loginDict)!
        
        AF.request(url,
                   method: .get,
                   parameters: parameters,
                   headers: RequestConfig.shared.headers)
        .validate()
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    static func multipartFormDataRequest<T: Decodable>(endpoint: String,
                                                       parameters: [String: String]? = nil,
                                                       files: [String: Data]? = nil,
                                                       responseType: T.Type,
                                                       completion: @escaping (Result<T, Error>) -> Void) {
        let loginDict = LoginConfig.getLoginInfo().toDictionary
        let url = URLQueryConfig.appendQueryDict(to: BASE_URL + endpoint, parameters: loginDict)!
        
        AF.upload(multipartFormData: { multipartFormData in
            parameters?.forEach { key, value in
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
            
            files?.forEach { key, data in
                multipartFormData.append(data, withName: key, fileName: "image.jpg", mimeType: "image/jpeg")
            }
        },
                  to: url,
                  headers: RequestConfig.shared.headers)
        .validate()
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
