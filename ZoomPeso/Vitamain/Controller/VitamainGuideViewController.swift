//
//  VitamainGuideViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay
import FSPagerView

class VitamainGuideViewController: BaseViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var photoModel = BehaviorRelay<netModel?>(value: nil)
    
    let imageNames = ["authone", "authtwo", "auththree", "authfour", "authfive"]
    let oneImageNames = ["authone_sel", "authtwo", "auththree", "authfour", "authfive"]
    let twoImageNames = ["authone_sel", "authtwo_sel", "auththree", "authfour", "authfive"]
    let threeImageNames = ["authone_sel", "authtwo_sel", "auththree_sel", "authfour", "authfive"]
    let fourImageNames = ["authone_sel", "authtwo_sel", "auththree_sel", "authfour_sel", "authfive"]
    let fiveImageNames = ["authone_sel", "authtwo_sel", "auththree_sel", "authfour_sel", "authfive_sel"]
    
    var imageArray: [String] = []
    
    var stepIndex: Int = 0
    
    lazy var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.image = UIImage(named: "moiamgeey")
        return oneImageView
    }()
    
    lazy var twoImageView: UIImageView = {
        let twoImageView = UIImageView()
        twoImageView.image = UIImage(named: "cofimge")
        return twoImageView
    }()
    
    lazy var moneyLabel: UILabel = {
        let moneyLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 59)!, textColor: .init(hexStr: "#712202")!, textAlignment: .left)
        return moneyLabel
    }()
    
    lazy var rightLabel: UILabel = {
        let rightLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .init(hexStr: "#F9732C")!, textAlignment: .center)
        return rightLabel
    }()
    
    lazy var leftLabel: UILabel = {
        let leftLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .init(hexStr: "#F9732C")!, textAlignment: .center)
        return leftLabel
    }()
    
    lazy var descLabel: UILabel = {
        let descLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .init(hexStr: "#FFFFFF")!, textAlignment: .center)
        descLabel.text = "Certifcation conditions"
        return descLabel
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.setTitle("Go Loan >", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18.pix())
        nextBtn.backgroundColor = .init(hexStr: "#FF3824")
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.layer.cornerRadius = 23.5
        nextBtn.layer.borderWidth = 2
        nextBtn.layer.borderColor = UIColor.init(hexStr: "#FCE69B")?.cgColor
        return nextBtn
    }()
    
    lazy var footImageView: UIImageView = {
        let footImageView = UIImageView()
        footImageView.image = UIImage(named: "dizuoimge")
        footImageView.isUserInteractionEnabled = true
        return footImageView
    }()
    
    lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView(frame: .zero)
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
        pagerView.isInfinite = true
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        pagerView.itemSize = CGSize(width: 210.pix(), height: 222.pix())
        pagerView.interitemSpacing = 15.pix()
        pagerView.backgroundColor = .clear
        return pagerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .init(hexStr: "#FD744D")
        view.addSubview(oneImageView)
        oneImageView.addSubview(moneyLabel)
        oneImageView.addSubview(rightLabel)
        oneImageView.addSubview(leftLabel)
        oneImageView.addSubview(twoImageView)
        oneImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(283.pix())
        }
        moneyLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(48.pix())
            make.bottom.equalToSuperview().offset(-57.pix())
            make.height.equalTo(62.pix())
        }
        rightLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10.pix())
            make.top.equalToSuperview().offset(97.pix())
            make.width.equalTo(80.pix())
            make.height.equalTo(25)
        }
        leftLabel.snp.makeConstraints { make in
            make.top.equalTo(rightLabel.snp.top)
            make.right.equalTo(rightLabel.snp.left).offset(-10.pix())
            make.height.equalTo(25)
            make.width.equalTo(121.pix())
        }
        twoImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(151.pix())
        }
        headView.nameLabel.text = "Product Detail"
        addHeadView()
        headView.backBlock = { [weak self] in
            guard let self = self else { return }
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        
        view.addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(twoImageView.snp.bottom)
            make.left.equalToSuperview().offset(12)
            make.height.equalTo(25.pix())
        }
        
        view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
        }
        
        view.addSubview(footImageView)
        footImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 350.pix(), height: 396.pix()))
            make.top.equalTo(descLabel.snp.bottom).offset(10)
        }
        
        view.addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.top.equalTo(footImageView.snp.top).offset(20.pix())
            make.width.equalTo(SCREEN_WIDTH)
            make.left.equalToSuperview()
            make.height.equalTo(222.pix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let characterized = model.enlarged?.characterized ?? 0
            let symbol = model.enlarged?.symbol ?? ""
            moneyLabel.text = "\(symbol)\(characterized)"
            rightLabel.text = model.enlarged?.examining?.adversary?.uvring ?? ""
            leftLabel.text = model.enlarged?.examining?.stings?.uvring ?? ""
            let step = model.pepsis?.rolled ?? ""
            if step == "numerous" {
                self.stepIndex = 0
            }else if step == "the" {
                self.stepIndex = 1
            }else if step == "and" {
                self.stepIndex = 2
            }else if step == "some" {
                self.stepIndex = 3
            }else if step == "both" {
                self.stepIndex = 4
            }else if step == "" {
                self.stepIndex = 5
            }
            pagerView.reloadData()
        }).disposed(by: disposeBag)
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
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
            if deadlystrength == 0 {
                let vitaminVc = VitamainOneViewController()
                vitaminVc.model.accept(self.model.value)
                self.navigationController?.pushViewController(vitaminVc, animated: true)
            }else {
                let vitaminVc = SFaceViewViewController()
                vitaminVc.model.accept(self.model.value)
                self.navigationController?.pushViewController(vitaminVc, animated: true)
            }
        }).disposed(by: disposeBag)
        
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
        ViewHudConfig.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded, "vitaman": "c"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
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
        ViewHudConfig.showLoading()
        let odID = model.enlarged?.tyrant ?? ""
        let mon = String(model.enlarged?.characterized ?? 0)
        let uvring = model.enlarged?.casts ?? ""
        let semicircular = String(model.enlarged?.semicircular ?? 0)
        let dict = ["contest": odID, "characterized": mon, "casts": uvring, "semicircular": semicircular]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/mine", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                ViewHudConfig.hideLoading()
                if success.wedge == "0" {
                    let time = DeviceInfo.currentTimestamp
                    let fievc = VitamainFiveViewController()
                    fievc.od = odID
                    fievc.pageUrl = success.net?.sucking ?? ""
                    self?.navigationController?.pushViewController(fievc, animated: true)
                    BuyPointConfig.pointToPageWithModel(with: "9", kstime: time, jstime: time, orNo: odID)
                }
                break
            case .failure(_):
                ViewHudConfig.hideLoading()
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
        cell.isHighlighted = false
        cell.contentView.backgroundColor = .clear
        return cell
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        guard let model = self.model.value else { return }
        if index == 0 {
            if stepIndex >= 0 {
                getAuthInfo()
            }
        }else if index == 1 {
            if stepIndex >= 1 {
                let vitamanVc = VitamainTwoViewController()
                vitamanVc.model.accept(model)
                self.navigationController?.pushViewController(vitamanVc, animated: true)
            }else {
                vitaminInfo(from: model) { model in
                    self.photoModel.accept(model)
                }
            }
        }else if index == 2 {
            if stepIndex >= 2 {
                let vitamanVc = VitamainThreeViewController()
                vitamanVc.model.accept(model)
                self.navigationController?.pushViewController(vitamanVc, animated: true)
            }else {
                vitaminInfo(from: model) { model in
                    self.photoModel.accept(model)
                }
            }
        }else if index == 3 {
            if stepIndex >= 3 {
                let vitamanVc = VitamainFourViewController()
                vitamanVc.model.accept(model)
                self.navigationController?.pushViewController(vitamanVc, animated: true)
            }else {
                vitaminInfo(from: model) { model in
                    self.photoModel.accept(model)
                }
            }
        }else if index == 4 {
            let vitamain = model.pepsis?.rolled ?? ""
            if vitamain.isEmpty {
                odIDWithString(with: model)
            }else {
                if stepIndex >= 4 {
                    let vitamanVc = VitamainFiveViewController()
                    vitamanVc.model.accept(model)
                    vitamanVc.pageUrl = model.pepsis?.sucking ?? ""
                    self.navigationController?.pushViewController(vitamanVc, animated: true)
                }else {
                    vitaminInfo(from: model) { model in
                        self.photoModel.accept(model)
                    }
                }
            }
        }
    }
}


