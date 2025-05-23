//
//  BaseViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import RxSwift
import RxRelay
import FBSDKCoreKit

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
    
    func popToVitamainGuideOrRoot() {
        if let viewControllers = navigationController?.viewControllers {
            if let targetVC = viewControllers.first(where: { $0 is VitamainGuideViewController }) {
                navigationController?.popToViewController(targetVC, animated: true)
            } else {
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
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
    
    func notiLastRootVcManager() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: CHANGE_ROOT_VC), object: nil)
    }
    
    ///idfa
    func apiIdfaInfo() {
        let toothed = DeviceIDManager.shared.getDeviceID()
        let clicking = DeviceIDManager.shared.getIDFA()
        let dict = ["toothed": toothed, "clicking": clicking]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/backs", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) || success.wedge == "00" {
                    if let sexesModel = DataLoginManager.shared.currentModel?.sexes {
                        zoomPesoFaceBook(from: sexesModel)
                    }
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func zoomPesoFaceBook(from model: sexesModel) {
        let appID = model.typical ?? ""
        let clientToken = model.die ?? ""
        let says = model.says ?? ""
        let bloodthirsty = model.bloodthirsty ?? ""
        Settings.shared.appID = appID
        Settings.shared.clientToken = clientToken
        Settings.shared.displayName = says
        Settings.shared.appURLSchemeSuffix = bloodthirsty
        ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
    }
    
    ///location
    func apiLoacationInfo(from model: LocationModel) {
        let disturb = model.disturb ?? ""
        let boast = model.boast ?? ""
        let cabinets = model.cabinets ?? ""
        let obscurely = model.obscurely ?? ""
        let coleoptera = String(format: "%.6f", model.coleoptera ?? 0.0)
        let disappointed = String(format: "%.6f", model.disappointed ?? 0.0)
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
        
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/encompassed",
                                                parameters: dict,
                                                responseType: BaseModel.self) {
            result in
            switch result {
            case .success(_):
                print("location======success")
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
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: deviceDict, options: [.prettyPrinted])
            let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
            let dict = ["net": jsonString]
            let man = NetworkRequstManager()
            man.multipartFormDataRequest(endpoint: "/surely/community", parameters: dict, responseType: BaseModel.self) { result in
                switch result {
                case .success(_):
                    break
                case .failure(_):
                    break
                }
            }
        } catch {
            print("JSON failure: \(error)")
        }
    }
    
    func showPermissionDeniedAlert(for permission: String) {
        let alert = UIAlertController(
            title: "Permission required",
            message: "To use this feature, please grant \(permission) access in Settings.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Setting", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        })
        present(alert, animated: true, completion: nil)
    }
    
}

/** productdetailinfo */
extension BaseViewController {
    
    func vitaminInfo(from model: netModel, complete: @escaping ((netModel) -> Void)) {
        guard let action = VitaminAction(rawValue: model.pepsis?.rolled ?? "") else { return }
        
        switch action {
        case .adc:
            popToVitamainGuideOrRoot()
        case .numerous:
            getAuthInfo(from: model, complete: complete)
        case .the, .and, .some, .both:
            
            let vc = action.makeViewController()
            
            if case .the = action, let vc = vc as? VitamainAbstractViewController {
                vc.model.accept(model)
            }
            if case .and = action, let vc = vc as? VitamainDynamicViewController {
                vc.model.accept(model)
            }
            if case .some = action, let vc = vc as? NameDynamicViewController {
                vc.model.accept(model)
            }
            
            if case .both = action, let vc = vc as? WebDynamicViewController {
                vc.model.accept(model)
                vc.pageUrl = model.pepsis?.sucking ?? ""
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    private enum VitaminAction: String {
        case numerous = "numerous"
        case the = "the"
        case and = "and"
        case some = "some"
        case both = "both"
        case adc = ""
        func makeViewController() -> BaseViewController {
            switch self {
            case .the: return VitamainAbstractViewController()
            case .and: return VitamainDynamicViewController()
            case .some: return NameDynamicViewController()
            case .both: return WebDynamicViewController()
            case .adc: return VitamainGuideViewController()
            default: fatalError("Unsupported type")
            }
        }
    }
    
    func getAuthInfo(from model: netModel, complete: @escaping ((netModel) -> Void)) {
        ViewCycleManager.showLoading()
        let barricaded = model.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded, "vitaman": "c"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                if ["0", "00"].contains(success.wedge) {
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
        ViewCycleManager.showLoading()
        let dict = ["barricaded": productID,
                    "controller": "productDetail",
                    "floss": "beer"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/mendoza", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    if let model = success.net {
                        complete(model)
                    }
                }else {
                    ToastManagerConfig.showToastText(form: view, message: success.circular ?? "")
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
        let schemeURL = AppURL.schemeURL
        if sucking.hasPrefix(schemeURL) {
            do {
                let params = try URLParameterParser.parseWithUrl(from: sucking)
                let barricaded = params["barricaded"] ?? ""
                self.productDetailInfo(from: barricaded) { [weak self] model in
                    guard let self = self else { return }
                    let aurl = model.pepsis?.rolled ?? ""
                    vitamainInfo(from: aurl, barricaded: barricaded, model: model)
                }
            } catch {
                print("Failed to parse URL parameters:", error)
            }
        }else {
            let fiveVc = WebDynamicViewController()
            fiveVc.pageUrl = sucking
            self.navigationController?.pushViewController(fiveVc, animated: true)
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
        let man = NetworkRequstManager()
        man.getRequest(endpoint: "/surely/azara", responseType: BaseModel.self) { result in
            switch result {
            case .success(let success):
                if ["0", "00"].contains(success.wedge) {
                    guard let model = success.net else { return }
                    complete(model)
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func judgeIsLogin() {
        
    }
    
}
