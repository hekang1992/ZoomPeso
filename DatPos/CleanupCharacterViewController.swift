
import UIKit
import ESPullToRefresh
import RxRelay
import CoreLocation

class CleanupCharacterViewController: OaklandLibidoViewController {
    
    var advancedModel = BehaviorRelay<netModel?>(value: nil)
    
    lazy var waddingView: CaballeroIncrementalHomeView = {
        let waddingView = CaballeroIncrementalHomeView()
        waddingView.isHidden = true
        return waddingView
    }()
    
    lazy var habatsuView: UbaVirtualobjMeraView = {
        let habatsuView = UbaVirtualobjMeraView()
        habatsuView.isHidden = true
        return habatsuView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(waddingView)
        waddingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(habatsuView)
        habatsuView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-90)
        }
        
        self.waddingView.scrollerView.es.addPullToRefresh { [weak self] in
                guard let self = self else { return }
                sabaloExceptionUat()
                batchCallLibration()
        }
        
        self.habatsuView.tableView.es.addInfiniteScrolling { [weak self] in
                guard let self = self else { return }
                sabaloExceptionUat()
                batchCallLibration()
        }
        
        self.waddingView.redrapeBlock = { [weak self] in
            guard let self = self else { return }
            
            if !IS_VISIBLE_LOGIN {
                let hierarchyLogin = AssociatedScreenNavigationController(rootViewController: ChainHabanaViewController())
                hierarchyLogin.modalPresentationStyle = .overFullScreen
                self.present(hierarchyLogin, animated: true)
                return
            }
            
            let model = DataLoginManager.shared.currentModel
            let cordillera = model?.cordillera ?? 0
            
            let status = CLLocationManager().authorizationStatus
            if status == .authorizedAlways || status == .authorizedWhenInUse {
                let ruby = self.advancedModel.value?.ruby ?? []
                for model in ruby {
                    let bajada = model.bajada ?? ""
                    if bajada == "allowing" {
                        let model = model.juices?.first
                        let orifice = model?.orifice ?? 0
                        self.iadActionQarnns(from: orifice)
                    }
                }
            }else {
                if cordillera == 1 {
                    if PopupManager.shouldShowPopup() {
                        showPermissionDeniedAlert(for: "Location", customMessage: "1")
                    }else {
                        let ruby = self.advancedModel.value?.ruby ?? []
                        for model in ruby {
                            let bajada = model.bajada ?? ""
                            if bajada == "allowing" {
                                let model = model.juices?.first
                                let orifice = model?.orifice ?? 0
                                self.iadActionQarnns(from: orifice)
                            }
                        }
                    }
                }else {
                    let ruby = self.advancedModel.value?.ruby ?? []
                    for model in ruby {
                        let bajada = model.bajada ?? ""
                        if bajada == "allowing" {
                            let model = model.juices?.first
                            let orifice = model?.orifice ?? 0
                            self.iadActionQarnns(from: orifice)
                        }
                    }
                }
            }
        }
        
        self.habatsuView.iabBlock = { [weak self] model in
            guard let self = self else { return }
            let orifice = model.orifice ?? 0
            self.iadActionQarnns(from: orifice)
        }
        
        self.habatsuView.cellBlock = { [weak self] model in
            guard let self = self else { return }
            let orifice = model.orifice ?? 0
            self.iadActionQarnns(from: orifice)
        }
        
        triangulationTransactionLibia { model in
            DataAddressManager.shared.currentModel = model
        }
        
        waddingView.oakmossBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            if !IS_VISIBLE_LOGIN {
                let hierarchyLogin = AssociatedScreenNavigationController(rootViewController: ChainHabanaViewController())
                hierarchyLogin.modalPresentationStyle = .overFullScreen
                self.present(hierarchyLogin, animated: true)
                return
            }
            let userUrl = self.advancedModel.value?.walckanaer?.azara ?? ""
            let satisfiabilityWeb = InfrastructureUbicationViewController()
            satisfiabilityWeb.planarityUrl = userUrl
            self.navigationController?.pushViewController(satisfiabilityWeb, animated: true)
        }).disposed(by: identifierBag)
        
        waddingView.eventBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let satisfiabilityWeb = InfrastructureUbicationViewController()
            satisfiabilityWeb.planarityUrl = habatsuUrl + "/pyrophorus"
            self.navigationController?.pushViewController(satisfiabilityWeb, animated: true)
        }).disposed(by: identifierBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sabaloExceptionUat()
        batchCallLibration()
    }
    
}

extension CleanupCharacterViewController {
    
    private func batchCallLibration() {
        ViewCycleManager.showLoading()
        let dict = [String: String]()
        let man = NetworkRequstManager()
        man.getRequest(endpoint: "/surely/station", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            self?.waddingView.scrollerView.es.stopPullToRefresh()
            self?.habatsuView.tableView.es.stopPullToRefresh()
            switch result {
            case .success(let success):
                if ["0", "00"].contains(success.wedge) {
                    if let model = success.net {
                        let ruby = model.ruby ?? []
                        for model in ruby {
                            let bajada = model.bajada ?? ""
                            if bajada == "compared" {
                                self?.habatsuView.isHidden = false
                                self?.waddingView.isHidden = true
                            }else {
                                self?.habatsuView.isHidden = true
                                self?.waddingView.isHidden = false
                            }
                        }
                        self?.advancedModel.accept(model)
                        self?.waddingView.model.accept(model)
                        self?.habatsuView.model.accept(model)
                        self?.habatsuView.tableView.reloadData()
                        self?.waddingView.pagerView.reloadData()
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func sabaloExceptionUat() {
        self.pdaCheckpointVee()
        let location = fabricableConfig()
        location.eaglewoodSidePaced { model in
            let status = CLLocationManager().authorizationStatus
            if status != .authorizedAlways || status != .authorizedWhenInUse {
            }
            self.daccaQdaDelegate(from: model)
        }
    }
    

    private func iadActionQarnns(from productID: Int) {
        if !IS_VISIBLE_LOGIN {
            let hierarchyLogin = AssociatedScreenNavigationController(rootViewController: ChainHabanaViewController())
            hierarchyLogin.modalPresentationStyle = .overFullScreen
            self.present(hierarchyLogin, animated: true)
            return
        }
        ViewCycleManager.showLoading()
        let dict = ["app": "1",
                    "barricaded": String(productID),
                    "coca": "1",
                    "recyle": "1"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/vertical", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                let wedge = success.wedge ?? ""
                if ["0", "00"].contains(wedge) {
                    if let self = self, let model = success.net {
                        self.kabobFlushNamed(from: model)
                    }
                }else if wedge == "-2" {
                    GabbyAardvarkLoginConfig.deleteLoginInfo()
                    self?.digitalGuiView()
                }else if wedge == "01" {
                    if let self = self {
                        ToastManagerConfig.showToastText(form: view, message: success.circular ?? "")
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
