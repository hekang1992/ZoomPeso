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
        
        self.homeView.scrollerView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            print("=========")
        })
        
    }

}

extension HomeViewController {
    
    private func getHomeInfo() {
        
    }
    
}
