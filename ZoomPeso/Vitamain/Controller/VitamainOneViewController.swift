//
//  VitamainOneViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay

class VitamainOneViewController: BaseViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var horrid = BehaviorRelay<[String]?>(value: nil)
    var larvae = BehaviorRelay<[String]?>(value: nil)
    
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
        
        getAuthInfo()
        
    }

}

extension VitamainOneViewController {
    
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
