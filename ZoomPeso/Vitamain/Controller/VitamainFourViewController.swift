//
//  VitamainFourViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay
import AVFoundation
import Photos
import TYAlertController
import Kingfisher
import Combine

class VitamainFourViewController: BaseViewController {
    
    var cancellables = Set<AnyCancellable>()
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var oneModel = BehaviorRelay<netModel?>(value: nil)
    
    lazy var hedImageView: UIImageView = {
        let hedImageView = UIImageView()
        hedImageView.image = UIImage(named: "seigmeiage")
        return hedImageView
    }()
    
    lazy var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.image = UIImage(named: "aseuthigme")
        return oneImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .white, textAlignment: .center)
        mlabel.text = "Step 1"
        return mlabel
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18.pix())
        nextBtn.backgroundColor = .init(hexStr: "#FF3824")
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.layer.cornerRadius = 23.5
        return nextBtn
    }()
    
    lazy var infoView: UIView = {
        let infoView = UIView()
        infoView.backgroundColor = .clear
        return infoView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(MyLoveViewCell.self, forCellReuseIdentifier: "MyLoveViewCell")
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
        
        self.headView.nameLabel.text = "Emergency contact"
        addHeadView()
        self.headView.backBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(hedImageView.snp.bottom).offset(-20)
        }
        view.addSubview(oneImageView)
        oneImageView.addSubview(mlabel)
        oneImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 358.pix(), height: 448.pix()))
        }
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
        }
        
        view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.bottom.equalToSuperview().offset(-30.pix())
        }
        
        view.addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.top.equalTo(oneImageView.snp.top).offset(82.pix())
            make.left.equalTo(oneImageView.snp.left).offset(6.5.pix())
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextBtn.snp.top).offset(-15.pix())
        }
        
        infoView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            
        }).disposed(by: disposeBag)
        
        getApiInfo()
    }
    
}

extension VitamainFourViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoView.layer.cornerRadius = 15
        infoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        infoView.layer.masksToBounds = true
    }
    
    private func getApiInfo() {
        ViewHudConfig.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded,
                    "bear": "1",
                    "cotton": "0"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/says", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    if let model = success.net {
                        self.oneModel.accept(model)
                        self.tableView.reloadData()
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}

extension VitamainFourViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 228.pix()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.oneModel.value
        return model?.army?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.oneModel.value?.army?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyLoveViewCell", for: indexPath) as! MyLoveViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.model.accept(model)
        return cell
    }
    
}

extension VitamainFourViewController {
    
}
