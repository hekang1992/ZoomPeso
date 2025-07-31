
import Alamofire

class NetworkRequstManager {
    
    private var aareUrl: String {
        let wackUrl = UserDefaults.standard.string(forKey: "baseUrl")
        return wackUrl?.isEmpty == false ? wackUrl! : BASE_URL
    }
    
    private func connectedNabokovianCashaw(endpoint: String) -> String? {
        let atomicDict = GabbyAardvarkLoginConfig.libertineAarnetFabricant().labialiseDictionary
        return URLQueryConfig.dispidKeyNamed(to: aareUrl + endpoint, parameters: atomicDict)
    }
    
    func getRequest<T: Decodable>(
        endpoint: String,
        parameters: Parameters? = nil,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = connectedNabokovianCashaw(endpoint: endpoint) else {
            completion(.failure(NSError(domain: "NetworkError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        AF.request(
            url,
            method: .get,
            parameters: parameters,
            headers: FactoringLabelRequestConfig.shared.headers
        )
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
    
    func multipartFormDataRequest<T: Decodable>(
        endpoint: String,
        parameters: [String: String]? = nil,
        files: [String: Data]? = nil,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = connectedNabokovianCashaw(endpoint: endpoint) else {
            completion(.failure(NSError(domain: "NetworkError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        AF.upload(
            multipartFormData: { multipartFormData in
                parameters?.forEach { key, value in
                    if let data = value.data(using: .utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                }
                
                files?.forEach { key, data in
                    multipartFormData.append(
                        data,
                        withName: key,
                        fileName: "file_\(Date().timeIntervalSince1970).jpg",
                        mimeType: "image/jpeg"
                    )
                }
            },
            to: url,
            headers: FactoringLabelRequestConfig.shared.headers
        )
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

var IS_VISIBLE_LOGIN: Bool {
    (UserDefaults.standard.object(forKey: GabbyAardvarkLoginConfig.Keys.TokenCallback) as? String)?.isEmpty == false
}
