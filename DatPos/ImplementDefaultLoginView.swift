
import UIKit

class ImplementDefaultLoginView: BaseView {
    
    var eventBlock: (() -> Void)?

    lazy var xanthinPhonelabel: UILabel = {
        let xanthinPhonelabel = UILabel()
        xanthinPhonelabel.text = "Telephone"
        xanthinPhonelabel.textColor = UIColor.black
        xanthinPhonelabel.textAlignment = .left
        xanthinPhonelabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return xanthinPhonelabel
    }()
    
    lazy var paceView: UIImageView = {
        let paceView = UIImageView()
        paceView.image = UIImage(named: "immutability_head_login")
        paceView.isUserInteractionEnabled = true
        return paceView
    }()
    
    lazy var loginImageView1: UIImageView = {
        let loginImageView1 = UIImageView()
        loginImageView1.image = UIImage(named: "haar_login_foot")
        loginImageView1.isUserInteractionEnabled = true
        return loginImageView1
    }()
    
    lazy var deductionView: UIView = {
        let deductionView = UIView()
        deductionView.backgroundColor = .white
        deductionView.layer.cornerRadius = 26
        return deductionView
    }()
    
    lazy var openField: UITextField = {
        let openField = UITextField()
        openField.keyboardType = .numberPad
        let eaglewoodString = NSMutableAttributedString(string: "Enter mobile number", attributes: [
            .foregroundColor: UIColor.init(cssStr: "#BFBEBE") as Any,
            .font: UIFont.systemFont(ofSize: 14)
        ])
        openField.attributedPlaceholder = eaglewoodString
        openField.font = UIFont.systemFont(ofSize: 14)
        openField.textColor = UIColor.black
        return openField
    }()
    
    lazy var xanthinCodelabel: UILabel = {
        let xanthinCodelabel = UILabel()
        xanthinCodelabel.text = "Verification " + "code"
        xanthinCodelabel.textColor = UIColor.black
        xanthinCodelabel.textAlignment = .left
        xanthinCodelabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return xanthinCodelabel
    }()
    
    lazy var pointerView: UIView = {
        let pointerView = UIView()
        pointerView.backgroundColor = .white
        pointerView.layer.cornerRadius = 26
        return pointerView
    }()
    
    lazy var localField: UITextField = {
        let localField = UITextField()
        localField.keyboardType = .numberPad
        let eaglewoodString = NSMutableAttributedString(string: "Verification code", attributes: [
            .foregroundColor: UIColor.init(cssStr: "#BFBEBE") as Any,
            .font: UIFont.systemFont(ofSize: 14)
        ])
        localField.attributedPlaceholder = eaglewoodString
        localField.font = UIFont.systemFont(ofSize: 14)
        localField.textColor = UIColor.black
        return localField
    }()
    
    lazy var veeLabel: UILabel = {
        let veeLabel = UILabel()
        let operandString = NSMutableAttributedString(string: "Get code")
        operandString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: "Get code".count)
        )
        veeLabel.attributedText = operandString
        veeLabel.textColor = UIColor(cssStr: "#FE5255")
        veeLabel.textAlignment = .right
        veeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return veeLabel
    }()
    
    lazy var throughBtn: UIButton = {
        let throughBtn = UIButton(type: .custom)
        throughBtn.contentHorizontalAlignment = .right
        throughBtn.setImage(UIImage(named: "solvingIconVoiceimage"), for: .normal)
        throughBtn.setTitle("VOZ", for: .normal)
        throughBtn.setTitleColor(UIColor.init(cssStr: "#FE5255"), for: .normal)
        throughBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        throughBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 7)
        return throughBtn
    }()
    
    lazy var schemaBtn: UIButton = {
        let schemaBtn = UIButton(type: .custom)
        schemaBtn.setTitle("Login", for: .normal)
        schemaBtn.backgroundColor = UIColor.init(cssStr: "#FF3825")
        schemaBtn.titleLabel?.font = UIFont(name: kafFont, size: 18)
        schemaBtn.layer.cornerRadius = 23.5
        return schemaBtn
    }()
    
    lazy var lateBtn: UIButton = {
        let lateBtn = UIButton(type: .custom)
        lateBtn.isSelected = true
        lateBtn.setImage(UIImage(named: "recordBgCyclenormail"), for: .normal)
        lateBtn.setImage(UIImage(named: "libraIconCycleselect"), for: .selected)
        return lateBtn
    }()
    
    lazy var partialBtn: UIButton = {
        let partialBtn = UIButton(type: .custom)
        partialBtn.setImage(UIImage(named: "fabianistRightBackimage"), for: .normal)
        return partialBtn
    }()
    
    lazy var uartLabel: UILabel = {
        let uartLabel = UILabel()
        let operandString = NSMutableAttributedString(string: "I've read and agreed with  <Privacy Agreement> ")
        operandString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 27, length: "<Privacy Agreement>".count)
        )
        uartLabel.attributedText = operandString
        uartLabel.textColor = UIColor.black
        uartLabel.textAlignment = .right
        uartLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return uartLabel
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(paceView)
        addSubview(loginImageView1)
        addSubview(partialBtn)
        addSubview(scrollView)
        
        scrollView.addSubview(xanthinPhonelabel)
        scrollView.addSubview(deductionView)
        deductionView.addSubview(openField)
        
        scrollView.addSubview(xanthinCodelabel)
        scrollView.addSubview(pointerView)
        pointerView.addSubview(localField)
        pointerView.addSubview(veeLabel)
        
        scrollView.addSubview(throughBtn)
        scrollView.addSubview(schemaBtn)
        
        paceView.snp.makeConstraints { make in
            make.top.leading.right.equalToSuperview()
            make.height.equalTo(400.pix())
        }
        loginImageView1.snp.makeConstraints { make in
            make.top.equalTo(paceView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(paceView.snp.bottom)
            make.left.bottom.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
        }
        xanthinPhonelabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(33)
            make.top.equalToSuperview()
            make.width.equalTo(250)
        }
        deductionView.snp.makeConstraints { make in
            make.top.equalTo(xanthinPhonelabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(33)
            make.height.equalTo(46)
        }
        openField.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.left.equalToSuperview().offset(17)
        }
        
        xanthinCodelabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(33)
            make.top.equalTo(deductionView.snp.bottom).offset(20)
            make.width.equalTo(250)
        }
        pointerView.snp.makeConstraints { make in
            make.top.equalTo(xanthinCodelabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(33)
            make.height.equalTo(46)
        }
        localField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(150)
            make.left.equalToSuperview().offset(17)
        }
        
        veeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-18)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        
        throughBtn.snp.makeConstraints { make in
            make.left.equalTo(SCREEN_WIDTH - 150)
            make.top.equalTo(pointerView.snp.bottom).offset(15)
            make.height.equalTo(20)
            make.width.equalTo(90)
        }
        
        schemaBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(66)
            make.height.equalTo(46)
            make.top.equalTo(pointerView.snp.bottom).offset(77)
        }
        
        scrollView.addSubview(uartLabel)
        uartLabel.snp.makeConstraints { make in
            make.top.equalTo(schemaBtn.snp.bottom).offset(22)
            make.centerX.equalToSuperview().offset(14)
            make.height.equalTo(17)            
            make.bottom.equalToSuperview().offset(-20)
        }
        
        scrollView.addSubview(lateBtn)
        lateBtn.snp.makeConstraints { make in
            make.centerY.equalTo(uartLabel.snp.centerY)
            make.right.equalTo(uartLabel.snp.left).offset(-2)
            make.size.equalTo(CGSize(width: 12, height: 12))
        }
        
        partialBtn.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(5)
            make.left.equalToSuperview().offset(5)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        partialBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.eventBlock?()
        }).disposed(by: identifierBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
