//
//  CenterView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/23.
//

import UIKit

class CenterView: BaseView {
    
    let picWidth = SCREEN_WIDTH * 0.25
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .init(hexStr: "#FD744D")
        return bgView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .black, textAlignment: .center)
        nameLabel.text = "Me"
        return nameLabel
    }()

    lazy var scro: UIScrollView = {
        let scro = UIScrollView()
        scro.showsHorizontalScrollIndicator = false
        scro.showsVerticalScrollIndicator = false
        scro.contentInsetAdjustmentBehavior = .never
        return scro
    }()
    
    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "centeriamge")
        return logoImageView
    }()
    
    lazy var oneBtn: UIButton = {
        let oneBtn = UIButton(type: .custom)
        oneBtn.setImage(UIImage(named: "alloreiamgece"), for: .normal)
        return oneBtn
    }()
    
    lazy var twoBtn: UIButton = {
        let twoBtn = UIButton(type: .custom)
        twoBtn.setImage(UIImage(named: "centeimagepa"), for: .normal)
        return twoBtn
    }()
    
    lazy var threeBtn: UIButton = {
        let threeBtn = UIButton(type: .custom)
        threeBtn.setImage(UIImage(named: "repcenteplay"), for: .normal)
        return threeBtn
    }()
    
    lazy var fourBtn: UIButton = {
        let fourBtn = UIButton(type: .custom)
        fourBtn.setImage(UIImage(named: "centefinshimge"), for: .normal)
        return fourBtn
    }()
    
    lazy var phonelabel: UILabel = {
        let phonelabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .white, textAlignment: .center)
        let phone = UserDefaults.standard.object(forKey: USER_PHONE) as? String ?? ""
        phonelabel.text = maskPhoneNumber(phone)
        return phonelabel
    }()
    
    lazy var aBtn: UIImageView = {
        let aBtn = UIImageView()
        aBtn.isUserInteractionEnabled = true
        aBtn.image = UIImage(named: "ajiamge")
        return aBtn
    }()
    
    lazy var bBtn: UIImageView = {
        let bBtn = UIImageView()
        bBtn.isUserInteractionEnabled = true
        bBtn.image = UIImage(named: "onelaige")
        return bBtn
    }()
    
    lazy var cBtn: UIImageView = {
        let cBtn = UIImageView()
        cBtn.isUserInteractionEnabled = true
        cBtn.image = UIImage(named: "seimgeting")
        return cBtn
    }()
    
    lazy var dBtn: UIImageView = {
        let dBtn = UIImageView()
        dBtn.isUserInteractionEnabled = true
        dBtn.image = UIImage(named: "yprice")
        return dBtn
    }()
    
    lazy var eBtn: UIImageView = {
        let eBtn = UIImageView()
        eBtn.isUserInteractionEnabled = true
        eBtn.image = UIImage(named: "facebookimge")
        return eBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoImageView)
        logoImageView.addSubview(phonelabel)
        logoImageView.addSubview(nameLabel)
        addSubview(bgView)
        addSubview(scro)
        bgView.addSubview(oneBtn)
        bgView.addSubview(twoBtn)
        bgView.addSubview(threeBtn)
        bgView.addSubview(fourBtn)
        
        logoImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(235.pix())
        }
        phonelabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12.pix())
            make.width.equalTo(200.pix())
            make.height.equalTo(56.pix())
            make.top.equalToSuperview().offset(110.pix())
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
        }
        bgView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(-30)
            make.left.bottom.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
        }
        oneBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15.pix())
            make.width.equalTo(79.pix())
            make.height.equalTo(92.pix())
        }
        
        twoBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(oneBtn.snp.right).offset(10.pix())
            make.width.equalTo(79.pix())
            make.height.equalTo(92.pix())
        }
        
        threeBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(twoBtn.snp.right).offset(10.pix())
            make.width.equalTo(79.pix())
            make.height.equalTo(92.pix())
        }
        
        fourBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(threeBtn.snp.right).offset(10.pix())
            make.width.equalTo(79.pix())
            make.height.equalTo(92.pix())
        }
        
        scro.snp.makeConstraints { make in
            make.top.equalTo(oneBtn.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.bottom.equalToSuperview().offset(-90)
        }
        
        scro.addSubview(aBtn)
        scro.addSubview(bBtn)
        scro.addSubview(cBtn)
        scro.addSubview(dBtn)
        scro.addSubview(eBtn)
        
        aBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        bBtn.snp.makeConstraints { make in
            make.top.equalTo(aBtn.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        cBtn.snp.makeConstraints { make in
            make.top.equalTo(bBtn.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        dBtn.snp.makeConstraints { make in
            make.top.equalTo(cBtn.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        eBtn.snp.makeConstraints { make in
            make.top.equalTo(dBtn.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.layer.cornerRadius = 30
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bgView.layer.masksToBounds = true
    }
    
    func maskPhoneNumber(_ phone: String) -> String {
        guard phone.count >= 10 else { return phone }
        let start = phone.prefix(3)
        let end = phone.suffix(4)
        return "\(start)****\(end)"
    }
    
}


