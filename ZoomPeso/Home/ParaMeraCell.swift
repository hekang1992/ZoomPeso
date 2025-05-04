//
//  ParaMeraCell.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/5/3.
//

import UIKit
import RxRelay

class ParaMeraCell: BaseViewCell {
    
    var model = BehaviorRelay<juicesModel?>(value: nil)
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.isUserInteractionEnabled = true
        bgImageView.image = UIImage(named: "paramigew")
        return bgImageView
    }()
    
    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.layer.cornerRadius = 2.5.pix()
        logoImageView.layer.masksToBounds = true
        return logoImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return nameLabel
    }()
    
    lazy var moneyLabel: UILabel = {
        let moneyLabel = UILabel.createLabel(font: UIFont.init(name: ArialBlackFont, size: 42)!, textColor: UIColor.init(hexStr: "#712202")!, textAlignment: .center)
        return moneyLabel
    }()
    
    lazy var aplyLabel: UILabel = {
        let aplyLabel = UILabel.createLabel(font: UIFont.init(name: ArialBlackFont, size: 19)!, textColor: .white, textAlignment: .center)
        return aplyLabel
    }()
    
    lazy var topLabel: UILabel = {
        let topLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12, weight: .medium), textColor: UIColor.init(hexStr: "#832F17")!, textAlignment: .right)
        return topLabel
    }()
    
    lazy var bottomLabel: UILabel = {
        let bottomLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12, weight: .medium), textColor: UIColor.init(hexStr: "#832F17")!, textAlignment: .right)
        return bottomLabel
    }()
    
    lazy var oneLabel: UILabel = {
        let oneLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14, weight: .medium), textColor: UIColor.init(hexStr: "#FFFFFF")!, textAlignment: .center)
        oneLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-9 * Double.pi / 180))
        return oneLabel
    }()
    
    lazy var twoLabel: UILabel = {
        let twoLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14, weight: .medium), textColor: UIColor.init(hexStr: "#FFFFFF")!, textAlignment: .center)
        twoLabel.transform = CGAffineTransform(rotationAngle: CGFloat(-9 * Double.pi / 180))
        return twoLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgImageView)
        bgImageView.addSubview(logoImageView)
        bgImageView.addSubview(nameLabel)
        bgImageView.addSubview(aplyLabel)
        bgImageView.addSubview(moneyLabel)
        bgImageView.addSubview(topLabel)
        bgImageView.addSubview(bottomLabel)
        bgImageView.addSubview(oneLabel)
        bgImageView.addSubview(twoLabel)
        bgImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.pix())
            make.size.equalTo(CGSize(width: 352.pix(), height: 220.pix()))
            make.centerX.equalToSuperview()
        }
        logoImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 22.pix(), height: 22.pix()))
            make.top.equalToSuperview().offset(15.pix())
            make.left.equalToSuperview().offset(14.pix())
        }
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(21.pix())
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.left.equalTo(logoImageView.snp.right).offset(5.pix())
        }
        aplyLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20.pix())
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.width.equalTo(150.pix())
        }
        moneyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(48.pix())
            make.height.equalTo(60.pix())
        }
        topLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-34.pix())
            make.height.equalTo(29.pix())
            make.top.equalTo(moneyLabel.snp.bottom).offset(15.pix())
        }
        bottomLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-34.pix())
            make.height.equalTo(29.pix())
            make.top.equalTo(topLabel.snp.bottom).offset(18.pix())
        }
        oneLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(17.pix())
            make.top.equalTo(moneyLabel.snp.bottom)
            make.height.equalTo(44.pix())
            make.width.equalTo(124.pix())
        }
        twoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(17.pix())
            make.top.equalTo(oneLabel.snp.bottom).offset(4.pix())
            make.height.equalTo(44.pix())
            make.width.equalTo(85.pix())
        }
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let ogo = model.antagonist ?? ""
            logoImageView.kf.setImage(with: URL(string: ogo))
            nameLabel.text = model.pitying ?? ""
            let aplt = model.thrusts ?? ""
            aplyLabel.text = "\(aplt) >"
            moneyLabel.text = model.vain ?? ""
            topLabel.text = model.perseveringly ?? ""
            bottomLabel.text = model.liberate ?? ""
            oneLabel.text = model.entangle ?? ""
            twoLabel.text = model.jerks ?? ""
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ParaMeraCell {
    
   
}
