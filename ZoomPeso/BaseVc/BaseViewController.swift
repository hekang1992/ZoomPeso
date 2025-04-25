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
    
    private var gradientLayer: CAGradientLayer!
    
    lazy var headView: VitamainGuideHeadView = {
        let headView = VitamainGuideHeadView()
        return headView
    }()
    
    lazy var emptyView: EmptyView = {
        let emptyView = EmptyView()
        return emptyView
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        return bgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
    }
    
}

extension BaseViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
        bgView.layer.cornerRadius = 30
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bgView.layer.masksToBounds = true
        gradientLayer.frame = bgView.bounds
    }
    
    private func setupGradient() {
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hexStr: "#FFF1CB")!.cgColor,
            UIColor(hexStr: "#FFDEA4")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        bgView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addHeadView() {
        view.addSubview(headView)
        headView.snp.makeConstraints { make in
            make.height.equalTo(40.pix())
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(-5)
        }
    }
    
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

/** productdetailinfo */
extension BaseViewController {
    
    func vitaminInfo(from model: netModel, complete: @escaping ((netModel) -> Void)) {
        let vitamain = model.pepsis?.rolled ?? ""
        switch vitamain {
        case "numerous":
            getAuthInfo(from: model, complete: complete)
            break
        case "the":
            let vitamanVc = VitamainTwoViewController()
            vitamanVc.model.accept(model)
            self.navigationController?.pushViewController(vitamanVc, animated: true)
            break
        case "and":
            let vitamanVc = VitamainThreeViewController()
            vitamanVc.model.accept(model)
            self.navigationController?.pushViewController(vitamanVc, animated: true)
            break
        case "some":
            let vitamanVc = VitamainFourViewController()
            vitamanVc.model.accept(model)
            self.navigationController?.pushViewController(vitamanVc, animated: true)
            break
        case "both":
            break
        default:
            break
        }
    }
    
    private func getAuthInfo(from model: netModel, complete: @escaping ((netModel) -> Void)) {
        ViewHudConfig.showLoading()
        let barricaded = model.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded, "vitaman": "c"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                if success.wedge == "0" {
                    if let model = success.net {
                        complete(model)
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func productDetailInfo(from productID: String, complete: @escaping (netModel) -> Void) {
        ViewHudConfig.showLoading()
        let dict = ["barricaded": productID,
                    "controller": "productDetail",
                    "floss": "beer"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/mendoza", parameters: dict, responseType: BaseModel.self) { result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                if success.wedge == "0" {
                    if let model = success.net {
                        complete(model)
                    }
                }
                break
            case .failure(_):
                let model = netModel()
                complete(model)
                break
            }
        }
    }
    
    func goAnyWhereInfo(from model: netModel) {
        let sucking = model.sucking ?? ""
        if sucking.hasPrefix(SCREME_URL) {
            let dict = URLParameterParser.parse(from: sucking)
            let barricaded = dict["barricaded"] ?? ""
            self.productDetailInfo(from: barricaded) { [weak self] model in
                guard let self = self else { return }
                let aurl = model.pepsis?.rolled ?? ""
                vitamainInfo(from: aurl, barricaded: barricaded, model: model)
            }
        }
    }
    
    private func vitamainInfo(from vitamain: String, barricaded: String, model: netModel) {
        let guideVc = VitamainGuideViewController()
        guideVc.model.accept(model)
        self.navigationController?.pushViewController(guideVc, animated: true)
    }
    
}

extension BaseViewController {
    
    func getAddressInfo(complete: @escaping ((netModel) -> Void)) {
        NetworkManager.getRequest(endpoint: "/surely/azara", responseType: BaseModel.self) { result in
            switch result {
            case .success(let success):
                if success.wedge == "0" {
                    guard let model = success.net else { return }
                    complete(model)
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
