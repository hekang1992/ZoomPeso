//
//  LoginView.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit

class LoginView: BaseView {
    
    var backBlock: (() -> Void)?

    lazy var loginImageView: UIImageView = {
        let loginImageView = UIImageView()
        loginImageView.image = UIImage(named: "loginimge")
        loginImageView.isUserInteractionEnabled = true
        return loginImageView
    }()
    
    lazy var desclabel: UILabel = {
        let desclabel = UILabel()
        desclabel.text = "Get approval in just \n1 minute"
        desclabel.textColor = UIColor.white
        desclabel.textAlignment = .left
        desclabel.numberOfLines = 0
        desclabel.font = UIFont(name: ArialBlackFont, size: 18)
        return desclabel
    }()
    
    lazy var phonelabel: UILabel = {
        let phonelabel = UILabel()
        phonelabel.text = "Telephone"
        phonelabel.textColor = UIColor.black
        phonelabel.textAlignment = .left
        phonelabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return phonelabel
    }()
    
    lazy var oneView: UIView = {
        let oneView = UIView()
        oneView.backgroundColor = .white
        oneView.layer.cornerRadius = 26
        return oneView
    }()
    
    lazy var phoneTx: UITextField = {
        let phoneTx = UITextField()
        phoneTx.keyboardType = .numberPad
        let attrString = NSMutableAttributedString(string: "Enter mobile number", attributes: [
            .foregroundColor: UIColor.init(hexStr: "#BFBEBE") as Any,
            .font: UIFont.systemFont(ofSize: 14)
        ])
        phoneTx.attributedPlaceholder = attrString
        phoneTx.font = UIFont.systemFont(ofSize: 14)
        phoneTx.textColor = UIColor.black
        return phoneTx
    }()
    
    lazy var codelabel: UILabel = {
        let codelabel = UILabel()
        codelabel.text = "Verification code"
        codelabel.textColor = UIColor.black
        codelabel.textAlignment = .left
        codelabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return codelabel
    }()
    
    lazy var twoView: UIView = {
        let twoView = UIView()
        twoView.backgroundColor = .white
        twoView.layer.cornerRadius = 26
        return twoView
    }()
    
    lazy var codeTx: UITextField = {
        let codeTx = UITextField()
        codeTx.keyboardType = .numberPad
        let attrString = NSMutableAttributedString(string: "Verification code", attributes: [
            .foregroundColor: UIColor.init(hexStr: "#BFBEBE") as Any,
            .font: UIFont.systemFont(ofSize: 14)
        ])
        codeTx.attributedPlaceholder = attrString
        codeTx.font = UIFont.systemFont(ofSize: 14)
        codeTx.textColor = UIColor.black
        return codeTx
    }()
    
    lazy var sendCodeLabel: UILabel = {
        let sendCodeLabel = UILabel()
        let attributedString = NSMutableAttributedString(string: "Get code")
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: "Get code".count)
        )
        sendCodeLabel.attributedText = attributedString
        sendCodeLabel.textColor = UIColor(hexStr: "#FF992F")
        sendCodeLabel.textAlignment = .right
        sendCodeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return sendCodeLabel
    }()
    
    lazy var voiceBtn: UIButton = {
        let voiceBtn = UIButton(type: .custom)
        voiceBtn.contentHorizontalAlignment = .right
        voiceBtn.setImage(UIImage(named: "voiceimage"), for: .normal)
        voiceBtn.setTitle("VOZ", for: .normal)
        voiceBtn.setTitleColor(UIColor.init(hexStr: "#FF992F"), for: .normal)
        voiceBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        voiceBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        return voiceBtn
    }()
    
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.backgroundColor = UIColor.init(hexStr: "#FF3824")
        loginBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18)
        loginBtn.layer.cornerRadius = 23.5
        return loginBtn
    }()
    
    lazy var cycleBtn: UIButton = {
        let cycleBtn = UIButton(type: .custom)
        cycleBtn.isSelected = true
        cycleBtn.setImage(UIImage(named: "cyclenormail"), for: .normal)
        cycleBtn.setImage(UIImage(named: "cycleselect"), for: .selected)
        return cycleBtn
    }()
    
    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "backimage"), for: .normal)
        return backBtn
    }()
    
    lazy var privacyLabel: UILabel = {
        let privacyLabel = UILabel()
        let attributedString = NSMutableAttributedString(string: "I've read and agreed with  <Privacy Agreement> ")
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 27, length: "<Privacy Agreement>".count)
        )
        privacyLabel.attributedText = attributedString
        privacyLabel.textColor = UIColor.black
        privacyLabel.textAlignment = .right
        privacyLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return privacyLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loginImageView)
        loginImageView.addSubview(desclabel)
        loginImageView.addSubview(phonelabel)
        loginImageView.addSubview(oneView)
        oneView.addSubview(phoneTx)
        
        loginImageView.addSubview(codelabel)
        loginImageView.addSubview(twoView)
        twoView.addSubview(codeTx)
        twoView.addSubview(sendCodeLabel)
        
        loginImageView.addSubview(voiceBtn)
        loginImageView.addSubview(loginBtn)
        
        loginImageView.addSubview(backBtn)
        
        loginImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        desclabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(64)
            make.right.equalToSuperview().offset(-104)
        }
        phonelabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(33)
            make.top.equalTo(desclabel.snp.bottom).offset(72)
            make.width.equalTo(250)
        }
        oneView.snp.makeConstraints { make in
            make.top.equalTo(phonelabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(33)
            make.height.equalTo(46)
        }
        phoneTx.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().offset(17)
        }
        
        codelabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(33)
            make.top.equalTo(oneView.snp.bottom).offset(20)
            make.width.equalTo(250)
        }
        twoView.snp.makeConstraints { make in
            make.top.equalTo(codelabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(33)
            make.height.equalTo(46)
        }
        codeTx.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(150)
            make.left.equalToSuperview().offset(17)
        }
        
        sendCodeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-18)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        
        voiceBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-40)
            make.top.equalTo(twoView.snp.bottom).offset(15)
            make.height.equalTo(20)
            make.width.equalTo(90)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(66)
            make.height.equalTo(46)
            make.top.equalTo(twoView.snp.bottom).offset(77)
        }
        
        loginImageView.addSubview(privacyLabel)
        privacyLabel.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).offset(22)
            make.centerX.equalToSuperview().offset(14)
            make.height.equalTo(17)
        }
        
        loginImageView.addSubview(cycleBtn)
        cycleBtn.snp.makeConstraints { make in
            make.centerY.equalTo(privacyLabel.snp.centerY)
            make.right.equalTo(privacyLabel.snp.left).offset(-2)
            make.size.equalTo(CGSize(width: 12, height: 12))
        }
        
        backBtn.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(5)
            make.left.equalToSuperview().offset(5)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.backBlock?()
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
