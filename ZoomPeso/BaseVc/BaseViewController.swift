//
//  BaseViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }

}

extension BaseViewController {
    
    func rootInfo() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: CHANGE_ROOT_VC), object: nil)
    }
    
    ///idfa
    func apiIdfaInfo() {
        let toothed = DeviceIDManager.shared.getDeviceID()
        let clicking = DeviceIDManager.shared.getIDFA()
        let dict = ["toothed": toothed, "clicking": clicking]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/backs",
                                                parameters: dict,
                                                responseType: BaseModel.self) {
            result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    ///location
    func apiLoacationInfo(from model: LocationModel) {
        let disturb = model.disturb ?? ""
        let boast = model.boast ?? ""
        let cabinets = model.cabinets ?? ""
        let obscurely = model.obscurely ?? ""
        let coleoptera = String(model.coleoptera ?? 0.0)
        let disappointed = String(model.disappointed ?? 0.0)
        let observation = model.observation ?? ""
        let error = model.error ?? ""
        
        let dict = ["disturb": disturb,
                    "boast": boast,
                    "cabinets": cabinets,
                    "obscurely": obscurely,
                    "coleoptera": coleoptera,
                    "disappointed": disappointed,
                    "observation": observation,
                    "error": error]
        
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/encompassed",
                                                parameters: dict,
                                                responseType: BaseModel.self) {
            result in
            switch result {
            case .success(_):
                break
            case .failure(let failure):
                print(failure.localizedDescription)
                break
            }
        }
        
        deviceApiInfo()
    }
    
    func deviceApiInfo() {
        let deviceDict = DeviceInfo.deviceAllInfo()
        let databyte = try? JSONSerialization.data(withJSONObject: deviceDict)
        let jsonStr = databyte?.base64EncodedString() ?? ""
        let dict = ["net": jsonStr]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/community", parameters: dict, responseType: BaseModel.self) { result in
            switch result {
            case .success(_):
                break
            case .failure(_):
                break
            }
        }
    }
    
}
