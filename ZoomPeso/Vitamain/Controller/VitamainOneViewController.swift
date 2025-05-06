//
//  VitamainOneViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/22.
//

import UIKit
import RxRelay

class VitamainOneViewController: BaseViewController {
        
    var horrid = BehaviorRelay<[String]?>(value: nil)
    
    var larvae = BehaviorRelay<[String]?>(value: nil)
    
    var time: String = ""
    
    lazy var hedImageView: UIImageView = {
        let hedImageView = UIImageView()
        hedImageView.image = UIImage(named: "seigmeiage")
        return hedImageView
    }()
    
    lazy var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.image = UIImage(named: "aseuthigme")
        oneImageView.isUserInteractionEnabled = true
        return oneImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .white, textAlignment: .center)
        mlabel.text = "Step 1"
        return mlabel
    }()
    
    lazy var m1label: UILabel = {
        let m1label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .init(hexStr: "#FF992F")!, textAlignment: .left)
        m1label.text = "Select An ID To Validate Your Identity"
        return m1label
    }()
    
    lazy var m2label: UILabel = {
        let m2label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .left)
        m2label.text = "Recommended ID Type"
        return m2label
    }()
    
    lazy var otherView: UIView = {
        let otherView = UIView()
        otherView.backgroundColor = .init(hexStr: "#FFFAED")
        otherView.layer.cornerRadius = 15
        return otherView
    }()
    
    lazy var m3label: UILabel = {
        let m3label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .init(hexStr: "#FF992F")!, textAlignment: .left)
        m3label.text = "Other Options"
        return m3label
    }()
    
    lazy var m4label: UILabel = {
        let m4label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .left)
        m4label.text = "Recommended ID Type"
        return m4label
    }()
    
    lazy var scro: UIScrollView = {
        let scro = UIScrollView()
        scro.backgroundColor = .clear
        scro.showsHorizontalScrollIndicator = false
        scro.showsVerticalScrollIndicator = false
        scro.contentInsetAdjustmentBehavior = .never
        return scro
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
    
    lazy var table1View: UITableView = {
        let table1View = UITableView(frame: .zero, style: .plain)
        table1View.separatorStyle = .none
        table1View.backgroundColor = .clear
        table1View.register(AuthViewCell.self, forCellReuseIdentifier: "AuthViewCell")
        table1View.estimatedRowHeight = 80
        table1View.showsVerticalScrollIndicator = false
        table1View.contentInsetAdjustmentBehavior = .never
        table1View.rowHeight = UITableView.automaticDimension
        if #available(iOS 15.0, *) {
            table1View.sectionHeaderTopPadding = 0
        }
        return table1View
    }()
    
    lazy var table2View: UITableView = {
        let table2View = UITableView(frame: .zero, style: .plain)
        table2View.separatorStyle = .none
        table2View.backgroundColor = .clear
        table2View.register(AuthViewCell.self, forCellReuseIdentifier: "AuthViewCell")
        table2View.estimatedRowHeight = 80
        table2View.showsVerticalScrollIndicator = false
        table2View.contentInsetAdjustmentBehavior = .never
        table2View.rowHeight = UITableView.automaticDimension
        if #available(iOS 15.0, *) {
            table2View.sectionHeaderTopPadding = 0
        }
        return table2View
    }()
    
    var select1IndexPath: IndexPath?
    var select2IndexPath: IndexPath?
    
    var oneGrand: Bool = false
    var twoGrand: Bool = false
    
    var selectAuthStr: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(hedImageView)
        hedImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        
        self.headView.nameLabel.text = "Select Identity Document"
        addHeadView()
        self.headView.backBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(hedImageView.snp.bottom).offset(-20)
        }
        
        view.addSubview(scro)
        scro.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(headView.snp.bottom).offset(5)
        }
        
        scro.addSubview(oneImageView)
        scro.addSubview(otherView)
        otherView.addSubview(m3label)
        otherView.addSubview(m4label)
        scro.addSubview(nextBtn)
        oneImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.size.equalTo(CGSize(width: 358.pix(), height: 417.pix()))
        }
        oneImageView.addSubview(mlabel)
        oneImageView.addSubview(m1label)
        oneImageView.addSubview(m2label)
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
        }
        m1label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalTo(mlabel.snp.bottom).offset(28.pix())
        }
        m2label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalTo(m1label.snp.bottom).offset(10.pix())
        }
        
        otherView.snp.makeConstraints { make in
            make.top.equalTo(oneImageView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 345.pix(), height: 333.pix()))
            make.centerX.equalToSuperview()
        }
        nextBtn.snp.makeConstraints { make in
            make.top.equalTo(otherView.snp.bottom).offset(47)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.bottom.equalToSuperview().offset(-30.pix())
        }
        
        oneImageView.addSubview(table1View)
        table1View.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(m2label.snp.bottom).offset(1)
            make.bottom.equalToSuperview().offset(-5)
        }
        
        otherView.addSubview(table2View)
        
        m3label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(16.pix())
        }
        m4label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalTo(m3label.snp.bottom).offset(10.pix())
        }
        
        table2View.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
            make.top.equalTo(m4label.snp.bottom).offset(1)
        }
        
        horrid.compactMap { $0 }.asObservable().bind(to: table1View.rx.items(cellIdentifier: "AuthViewCell", cellType: AuthViewCell.self)) { row, model, cell in
            cell.nameLabel.text = model
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            if self.oneGrand && self.select1IndexPath?.row == row {
                cell.bgView.backgroundColor = .init(hexStr: "#FF992F")
            }else {
                cell.bgView.backgroundColor = .init(hexStr: "#FFF5C3")
            }
        }.disposed(by: disposeBag)
        
        larvae.compactMap { $0 }.asObservable().bind(to: table2View.rx.items(cellIdentifier: "AuthViewCell", cellType: AuthViewCell.self)) { row, model, cell in
            cell.nameLabel.text = model
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            if self.twoGrand && self.select2IndexPath?.row == row {
                cell.bgView.backgroundColor = .init(hexStr: "#FF992F")
            }else {
                cell.bgView.backgroundColor = .init(hexStr: "#FFF5C3")
            }
        }.disposed(by: disposeBag)
        
        table1View.rx.setDelegate(self).disposed(by: disposeBag)
        table2View.rx.setDelegate(self).disposed(by: disposeBag)
        
        
        table1View.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            time = DeviceInfo.currentTimestamp
            self.selectAuthStr = horrid.value?[indexPath.row] ?? ""
            oneGrand = true
            twoGrand = false
            table2View.reloadData()
            if let previousIndexPath = select1IndexPath {
                if let previousCell = self.table1View.cellForRow(at: previousIndexPath) as? AuthViewCell {
                    previousCell.bgView.backgroundColor = .init(hexStr: "#FFF5C3")
                }
            }
            if let cell = self.table1View.cellForRow(at: indexPath) as? AuthViewCell {
                cell.bgView.backgroundColor = .init(hexStr: "#FF992F")
            }
            select1IndexPath = indexPath
        }).disposed(by: disposeBag)
        
        table2View.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            time = DeviceInfo.currentTimestamp
            self.selectAuthStr = larvae.value?[indexPath.row] ?? ""
            oneGrand = false
            twoGrand = true
            table1View.reloadData()
            if let previousIndexPath = select2IndexPath {
                if let previousCell = self.table2View.cellForRow(at: previousIndexPath) as? AuthViewCell {
                    previousCell.bgView.backgroundColor = .init(hexStr: "#FFF5C3")
                }
            }
            if let cell = self.table2View.cellForRow(at: indexPath) as? AuthViewCell {
                cell.bgView.backgroundColor = .init(hexStr: "#FF992F")
            }
            select2IndexPath = indexPath
        }).disposed(by: disposeBag)
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let model = self.model.value else { return }
            if self.selectAuthStr.isEmpty {
                ToastManagerConfig.showToastText(form: view, message: "Please select an authentication method")
                return
            }
            let imageVc = AuthImageViewController()
            imageVc.model.accept(model)
            imageVc.enthusiastic = selectAuthStr
            self.navigationController?.pushViewController(imageVc, animated: true)
            print("auth=====\(self.selectAuthStr)")
            BuyPointConfig.pointToPageWithModel(with: "2", kstime: time, jstime: DeviceInfo.currentTimestamp)
        }).disposed(by: disposeBag)
        
        getAuthInfo()
        
    }
    
}

extension VitamainOneViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        return headView
    }
    
    private func getAuthInfo() {
        ViewCycleManager.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded,
                    "vitaman": "q",
                    "zoom": "video"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    //ma
                    self.horrid.accept(success.net?.horrid ?? [])
                    //mc
                    self.larvae.accept(success.net?.larvae ?? [])
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
