//
//  OrderListViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/23.
//

import UIKit
import MJRefresh
import RxRelay

class OrderListViewController: BaseViewController {
    
    var orderType: String = String(Int(2 + 2))
    var nameType: String = "All"
    
    var modelArray = BehaviorRelay<[rubyModel]?>(value: nil)
    
    lazy var hedImageView: UIImageView = {
        let hedImageView = UIImageView()
        hedImageView.image = UIImage(named: "seigmeiage")
        return hedImageView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(OrderListViewCell.self, forCellReuseIdentifier: "OrderListViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(hedImageView)
        hedImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        
        self.headView.nameLabel.text = nameType
        addHeadView()
        self.headView.backBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(hedImageView.snp.bottom).offset(-30)
        }
        
        bgView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            guard let self = self else { return }
            getListInfo(from: orderType)
        })
        
        getListInfo(from: orderType)
        
    }
    
}


extension OrderListViewController {
    
    private func getListInfo(from refer: String) {
        ViewCycleManager.showLoading()
        let dict = ["refer": refer,
                    "ems": "1",
                    "order": "1"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/theridion", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            self?.tableView.mj_header?.endRefreshing()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                let wedge = success.wedge ?? ""
                if ["0", "00"].contains(wedge) {
                    let ruby = success.net?.ruby ?? []
                    self.modelArray.accept(ruby)
                    self.tableView.reloadData()
                    if ruby.isEmpty {
                        self.tableView.addSubview(emptyView)
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

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 188.pix()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelArray.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.modelArray.value?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListViewCell", for: indexPath) as! OrderListViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.model.accept(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.modelArray.value?[indexPath.row]
        let antenn = model?.antenn ?? ""
        let nmodel = netModel()
        nmodel.sucking = antenn
        goAnyWhereInfo(from: nmodel)
    }
    
}
