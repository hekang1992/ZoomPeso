//
//  HomeViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit
import MJRefresh

class HomeViewController: BaseViewController {
    
    lazy var homeView: HomeView = {
        let homeView = HomeView()
        return homeView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(homeView)
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    
        self.homeView.scrollerView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            guard let self = self else { return }
            idfaAndLocationInfo()
            getHomeInfo()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idfaAndLocationInfo()
        getHomeInfo()
    }

}

extension HomeViewController {
    
    private func getHomeInfo() {
        ViewHudConfig.showLoading()
        let dict = [String: String]()
        NetworkManager.getRequest(endpoint: "/surely/station", parameters: dict, responseType: BaseModel.self) { result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                break
            case .failure(let failure):
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
    
}
