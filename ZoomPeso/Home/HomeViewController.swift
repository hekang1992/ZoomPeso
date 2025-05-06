//
//  HomeViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import MJRefresh
import RxRelay

class HomeViewController: BaseViewController {
    
    var homeModel = BehaviorRelay<netModel?>(value: nil)
    
    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.isHidden = true
        return homeView
    }()
    
    lazy var paraView: ParaMeraView = {
        let paraView = ParaMeraView()
        paraView.isHidden = true
        return paraView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(paraView)
        paraView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.homeView.scrollerView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            guard let self = self else { return }
            idfaAndLocationInfo()
            getHomeInfo()
        })
        
        self.paraView.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            guard let self = self else { return }
            idfaAndLocationInfo()
            getHomeInfo()
        })
        
        self.homeView.applyBlock = { [weak self] in
            guard let self = self else { return }
            let ruby = self.homeModel.value?.ruby ?? []
            for model in ruby {
                let bajada = model.bajada ?? ""
                if bajada == "allowing" {
                    let model = model.juices?.first
                    let orifice = model?.orifice ?? 0
                    self.sqProductInfo(from: orifice)
                }
            }
        }
        
        self.paraView.headBlock = { [weak self] model in
            guard let self = self else { return }
            let orifice = model.orifice ?? 0
            self.sqProductInfo(from: orifice)
        }
        
        self.paraView.cellBlock = { [weak self] model in
            guard let self = self else { return }
            let orifice = model.orifice ?? 0
            self.sqProductInfo(from: orifice)
        }
        
        getAddressInfo { model in
            DataAddressManager.shared.currentModel = model
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idfaAndLocationInfo()
        getHomeInfo()
    }
    
}

extension HomeViewController {
    
    private func getHomeInfo() {
        ViewCycleManager.showLoading()
        let dict = [String: String]()
        NetworkManager.getRequest(endpoint: "/surely/station", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            self?.homeView.scrollerView.mj_header?.endRefreshing()
            self?.paraView.tableView.mj_header?.endRefreshing()
            switch result {
            case .success(let success):
                if success.wedge == "0" {
                    if let model = success.net {
                        let ruby = model.ruby ?? []
                        for model in ruby {
                            let bajada = model.bajada ?? ""
                            if bajada == "compared" {
                                self?.paraView.isHidden = false
                                self?.homeView.isHidden = true
                            }else {
                                self?.paraView.isHidden = true
                                self?.homeView.isHidden = false
                            }
                        }
                        self?.homeModel.accept(model)
                        self?.homeView.model.accept(model)
                        self?.paraView.model.accept(model)
                        self?.paraView.tableView.reloadData()
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func idfaAndLocationInfo() {
        self.apiIdfaInfo()
        let location = LocationConfig()
        location.getLocationInfo { model in
            self.apiLoacationInfo(from: model)
        }
    }
    
    private func sqProductInfo(from productID: Int) {
        ViewCycleManager.showLoading()
        let dict = ["app": "1",
                    "barricaded": String(productID),
                    "coca": "1",
                    "recyle": "1"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/vertical", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                let wedge = success.wedge ?? ""
                if wedge == "0" {
                    if let self = self, let model = success.net {
                        self.goAnyWhereInfo(from: model)
                    }
                }else if wedge == "-2" {
                    LoginConfig.deleteLoginInfo()
                    self?.notiRootManager()
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
