//
//  VitamainGuideViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay

class VitamainGuideViewController: BaseViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
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
        leftLabel.snp.makeConstraints { make in
            
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
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let characterized = model.enlarged?.characterized ?? 0
            let symbol = model.enlarged?.symbol ?? ""
            moneyLabel.text = "\(symbol)\(characterized)"
            rightLabel.text = model.enlarged?.examining?.adversary?.uvring ?? ""
            leftLabel.text = model.enlarged?.examining?.stings?.uvring ?? ""
        }).disposed(by: disposeBag)
        
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let model = self.model.value else { return }
            vitaminInfo(from: model)
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
    
    private func vitaminInfo(from model: netModel) {
        let vitamain = model.pepsis?.rolled ?? ""
        switch vitamain {
        case "numerous":
            let vitaminVc = VitamainOneViewController()
            vitaminVc.model.accept(model)
            self.navigationController?.pushViewController(vitaminVc, animated: true)
            break
        case "the":
            break
        case "and":
            break
        case "some":
            break
        case "both":
            break
        default:
            break
        }
    }

}
