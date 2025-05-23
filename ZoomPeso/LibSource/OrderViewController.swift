//
//  OrderViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import MJRefresh

class OrderViewController: BaseViewController {
    
    lazy var listView: OrderListView = {
        let listView = OrderListView()
        return listView
    }()
    
    var listStr: String = "4"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(listView)
        listView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-90)
        }
        
        self.listView.oneBlock = { [weak self] in
            guard let self = self else { return }
            judgeIsLogin()
            self.listStr = "4"
            getListInfo(from: "4")
        }
        
        self.listView.twoBlock = { [weak self] in
            guard let self = self else { return }
            judgeIsLogin()
            self.listStr = "7"
            getListInfo(from: "7")
        }
        
        self.listView.threeBlock = { [weak self] in
            guard let self = self else { return }
            judgeIsLogin()
            self.listStr = "6"
            getListInfo(from: "6")
        }
        
        self.listView.fourBlock = { [weak self] in
            guard let self = self else { return }
            judgeIsLogin()
            self.listStr = "5"
            getListInfo(from: "5")
        }
        
        self.listView.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            guard let self = self else { return }
            getListInfo(from: listStr)
        })
        
        self.listView.block = { [weak self] model in
            guard let self = self else { return }
            judgeIsLogin()
            let antenn = model.antenn ?? ""
            let model1 = netModel()
            model1.sucking = antenn
            goAnyWhereInfo(from: model1)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getListInfo(from: listStr)
    }

}

extension OrderViewController {
    
    private func getListInfo(from refer: String) {
        ViewCycleManager.showLoading()
        let dict = ["refer": refer,
                    "page": "1",
                    "pageSize": "100",
                    "tips": "1",
                    "focus": "0"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/theridion", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            self?.listView.tableView.mj_header?.endRefreshing()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                let wedge = success.wedge ?? ""
                if ["0", "00"].contains(wedge) {
                    let ruby = success.net?.ruby ?? []
                    self.listView.modelArray.accept(ruby)
                    self.listView.tableView.reloadData()
                    if ruby.isEmpty {
                        self.listView.tableView.addSubview(emptyView)
                        emptyView.snp.makeConstraints { make in
                            make.edges.equalToSuperview()
                        }
                    }else {
                        self.emptyView.removeFromSuperview()
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
