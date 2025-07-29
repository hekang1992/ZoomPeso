//
//  VitamainGuideViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/22.
//

import UIKit
import RxRelay
import FSPagerView

class VitamainGuideViewController: BaseViewController {
    
    var photoModel = BehaviorRelay<netModel?>(value: nil)
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var imageNames = ["authone", "authtwo", "auththree", "authfour", "authfive"]
    
    var oneImageNames = ["authone_sel", "authtwo", "auththree", "authfour", "authfive"]
    
    var twoImageNames = ["authone_sel", "authtwo_sel", "auththree", "authfour", "authfive"]
    
    var threeImageNames = ["authone_sel", "authtwo_sel", "auththree_sel", "authfour", "authfive"]
    
    var fourImageNames = ["authone_sel", "authtwo_sel", "auththree_sel", "authfour_sel", "authfive"]
    
    var fiveImageNames = ["authone_sel", "authtwo_sel", "auththree_sel", "authfour_sel", "authfive_sel"]
    
    var imageArray: [String] = []
    
    var stepIndex: Int = 0
    
    lazy var topView: TopGuideView = {
        let topView = TopGuideView()
        return topView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .init(cssHexStr: "#83D1FE")
        
        
        self.topView.pagerView.delegate = self
        self.topView.pagerView.dataSource = self
        
        
        
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addHeadView()
        headView.backBlock = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            headView.nameLabel.text = model.enlarged?.pitying ?? ""
            let characterized = model.enlarged?.characterized ?? 0
            let symbol = model.enlarged?.symbol ?? ""
                self.topView.moneyLabel.text = "\(symbol)\(characterized)"
            self.topView.rightLabel.text = model.enlarged?.examining?.adversary?.uvring ?? ""
            self.topView.leftLabel.text = model.enlarged?.examining?.stings?.uvring ?? ""
            let stepMapping: [String: Int] = [
                "numerous": 0,
                "the": 1,
                "and": 2,
                "some": 3,
                "both": 4,
                "": 5
            ]
            self.stepIndex = stepMapping[model.pepsis?.rolled ?? ""] ?? 0
            self.topView.pagerView.reloadData()
        }).disposed(by: disposeBag)
        
        self.topView.nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let model = self.model.value else { return }
            let vitamain = model.pepsis?.rolled ?? ""
            if vitamain.isEmpty {
                odIDWithString(with: model)
            }else {
                vitaminInfo(from: model) { model in
                    self.photoModel.accept(model)
                }
            }
        }).disposed(by: disposeBag)
        
        self.photoModel.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let deadlystrength = model.deadly?.strength ?? 0
            let victimsstrength = model.victims?.strength ?? 0
            if deadlystrength == 0 && victimsstrength == 0 {
                let vitaminVc = VitamainGeneralViewController()
                if let model = self.model.value {
                    vitaminVc.model.accept(model)
                }
                self.navigationController?.pushViewController(vitaminVc, animated: true)
            }else if deadlystrength == 1 && victimsstrength == 0 {
                let vitaminVc = SFAppRoveViewViewController()
                if let model = self.model.value {
                    vitaminVc.model.accept(model)
                }
                self.navigationController?.pushViewController(vitaminVc, animated: true)
            }else if deadlystrength == 1 && victimsstrength == 1   {
                let vitaminVc = ApproachAuthViewController()
                if let model = self.model.value {
                    vitaminVc.model.accept(model)
                }
                self.navigationController?.pushViewController(vitaminVc, animated: true)
            }
        }).disposed(by: disposeBag)
        
        let listArray = self.model.value?.finding ?? []
        let keyworks = ["numerous", "the", "and", "some", "both"]
        var imageArray: [String] = []
        for model in listArray {
            imageArray.append(model.rolled ?? "")
        }
        if listArray.count == 4 {
            imageNames.remove(at: 3)
            oneImageNames.remove(at: 3)
            twoImageNames.remove(at: 3)
            threeImageNames.remove(at: 3)
            fourImageNames.remove(at: 3)
            fiveImageNames.remove(at: 3)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        self.productDetailInfo(from: barricaded) { [weak self] model in
            guard let self = self else { return }
            self.model.accept(model)
        }
    }
    
    private func getAuthInfo() {
        ViewCycleManager.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded,
                    "vitaman": "e",
                    "peso": "1"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    if let model = success.net {
                        self.photoModel.accept(model)
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func odIDWithString(with model: netModel) {
        ViewCycleManager.showLoading()
        let odID = model.enlarged?.tyrant ?? ""
        let mon = String(model.enlarged?.characterized ?? 0)
        let uvring = model.enlarged?.casts ?? ""
        let semicircular = String(model.enlarged?.semicircular ?? 0)
        let date = DeviceInfo.currentTimestamp
        let dict = ["contest": odID,
                    "characterized": mon,
                    "casts": uvring,
                    "semicircular": semicircular,
                    "date": date]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/mine", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                ViewCycleManager.hideLoading()
                if ["0", "00"].contains(success.wedge) {
                    let time = DeviceInfo.currentTimestamp
                    let fievc = WebDynamicViewController()
                    fievc.odNum = odID
                    fievc.pageUrl = success.net?.sucking ?? ""
                    self?.navigationController?.pushViewController(fievc, animated: true)
                    ScroPortionPointConfig.pointToPageWithModel(with: "9", kstime: time, jstime: time, orNo: odID)
                }
                break
            case .failure(_):
                ViewCycleManager.hideLoading()
                break
            }
        }
    }
    
}

extension VitamainGuideViewController: FSPagerViewDelegate, FSPagerViewDataSource {
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FSPagerViewCell", at: index)
        let rolled = self.model.value?.pepsis?.rolled ?? ""
        if rolled == "numerous" {
            imageArray = imageNames
        }else if rolled == "the" {
            imageArray = oneImageNames
        }else if rolled == "and" {
            imageArray = twoImageNames
        }else if rolled == "some" {
            imageArray = threeImageNames
        }else if rolled == "both" {
            imageArray = fourImageNames
        }else {
            imageArray = fiveImageNames
        }
        cell.imageView?.image = UIImage(named: imageArray[index])
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        let listArray = model.value?.finding ?? []
        return listArray.count
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        guard let model = self.model.value else { return }
        let rolled = model.finding?[index].rolled ?? ""
        if rolled == "numerous" {
            if stepIndex >= index {
                getAuthInfo()
            }
        }else if rolled == "the" {
            if stepIndex >= index {
                let vitamanVc = VitamainAbstractViewController()
                vitamanVc.model.accept(model)
                self.navigationController?.pushViewController(vitamanVc, animated: true)
            }else {
                vitaminInfo(from: model) { model in
                    self.photoModel.accept(model)
                }
            }
        }else if rolled == "and" {
            if stepIndex >= index {
                let vitamanVc = VitamainDynamicViewController()
                vitamanVc.model.accept(model)
                self.navigationController?.pushViewController(vitamanVc, animated: true)
            }else {
                vitaminInfo(from: model) { model in
                    self.photoModel.accept(model)
                }
            }
        }else if rolled == "some" {
            if stepIndex >= index {
                let vitamanVc = NameDynamicViewController()
                vitamanVc.model.accept(model)
                self.navigationController?.pushViewController(vitamanVc, animated: true)
            }else {
                vitaminInfo(from: model) { model in
                    self.photoModel.accept(model)
                }
            }
        }else if rolled == "both" {
            let vitamain = model.pepsis?.rolled ?? ""
            let sucking = model.finding?[index].sucking
            if vitamain.isEmpty {
                //odIDWithString(with: model)
                let webVc = WebDynamicViewController()
                webVc.pageUrl = sucking
                self.navigationController?.pushViewController(webVc, animated: true)
            }else {
                if stepIndex >= index {
                    let vitamanVc = WebDynamicViewController()
                    vitamanVc.pageUrl = model.pepsis?.sucking ?? ""
                    vitamanVc.model.accept(model)
                    self.navigationController?.pushViewController(vitamanVc, animated: true)
                }else {
                    vitaminInfo(from: model) { model in
                        self.photoModel.accept(model)
                    }
                }
            }
        }else {
            
        }
    }
}


