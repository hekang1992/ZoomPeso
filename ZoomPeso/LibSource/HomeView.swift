//
//  HomeView.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import RxRelay

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

class HomeView: BaseView {
    
    var applyBlock: (() -> Void)?
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    private var gradientLayer: CAGradientLayer!
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        return bgView
    }()
    
    lazy var scrollerView: UIScrollView = {
        let scrollerView = UIScrollView()
        scrollerView.showsHorizontalScrollIndicator = false
        scrollerView.showsVerticalScrollIndicator = false
        scrollerView.contentInsetAdjustmentBehavior = .never
        return scrollerView
    }()
    
    lazy var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.image = UIImage(named: "omeimage")
        return oneImageView
    }()
    
    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.layer.cornerRadius = 5
        logoImageView.layer.masksToBounds = true
        return logoImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .semibold), textColor: .white, textAlignment: .left)
        return nameLabel
    }()
    
    lazy var oneLabel: UILabel = {
        let oneLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 20.pix())!, textColor: .init(hexStr: "#2A1512")!, textAlignment: .center)
        return oneLabel
    }()
    
    lazy var moneyLabel: UILabel = {
        let moneyLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 55.pix())!, textColor: .init(hexStr: "#EB3516")!, textAlignment: .center)
        return moneyLabel
    }()
    
    lazy var twoLabel: UILabel = {
        let twoLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(hexStr: "#F1E4A8")!, textAlignment: .center)
        return twoLabel
    }()
    
    lazy var threeLabel: UILabel = {
        let threeLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(hexStr: "#B79714")!, textAlignment: .center)
        return threeLabel
    }()
    
    lazy var fourLabel: UILabel = {
        let fourLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(hexStr: "#F1E4A8")!, textAlignment: .center)
        return fourLabel
    }()
    
    lazy var fiveLabel: UILabel = {
        let fiveLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(hexStr: "#B79714")!, textAlignment: .center)
        return fiveLabel
    }()
    
    lazy var loanImageView: UIImageView = {
        let loanImageView = UIImageView()
        loanImageView.image = UIImage(named: "loaiimge")
        loanImageView.isUserInteractionEnabled = true
        return loanImageView
    }()
    
    lazy var desrightImageMainView: UIImageView = {
        let desrightImageMainView = UIImageView()
        desrightImageMainView.image = UIImage(named: "threeimage")
        return desrightImageMainView
    }()
    
    lazy var twoImageView: UIImageView = {
        let twoImageView = UIImageView()
        twoImageView.image = UIImage(named: "kimagesix")
        return twoImageView
    }()
    
    lazy var threeImageView: UIImageView = {
        let threeImageView = UIImageView()
        threeImageView.isUserInteractionEnabled = true
        threeImageView.image = UIImage(named: "legimge")
        return threeImageView
    }()
    
    lazy var fourImageView: UIImageView = {
        let fourImageView = UIImageView()
        fourImageView.isUserInteractionEnabled = true
        fourImageView.image = UIImage(named: "rightimage")
        return fourImageView
    }()
    
    lazy var fiveImageView: UIImageView = {
        let fiveImageView = UIImageView()
        fiveImageView.image = UIImage(named: "adimage")
        return fiveImageView
    }()
    
    lazy var scrollMinView: UIScrollView = {
        let scrollMinView = UIScrollView()
        scrollMinView.contentSize = CGSize(width: SCREEN_WIDTH * 2, height: 233.pix())
        scrollMinView.bounces = false
        scrollMinView.isPagingEnabled = true
        scrollMinView.showsHorizontalScrollIndicator = false
        return scrollMinView
    }()
    
    lazy var sixImageView: UIImageView = {
        let sixImageView = UIImageView()
        sixImageView.image = UIImage(named: "adimgetwo")
        return sixImageView
    }()
    
    lazy var sixLsImageView: UIImageView = {
        let sixLsImageView = UIImageView()
        sixLsImageView.image = UIImage(named: "adimgeledtimage")
        return sixLsImageView
    }()
    
    lazy var footImageView: UIImageView = {
        let footImageView = UIImageView()
        footImageView.image = UIImage(named: "adimgetrhre")
        return footImageView
    }()
    
    lazy var whiteView: UIView = {
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        return whiteView
    }()
    
    lazy var applyLabel: UILabel = {
        let applyLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 29.pix())!, textColor: .white, textAlignment: .right)
        return applyLabel
    }()
    
    lazy var fuckLabel: UILabel = {
        let fuckLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18.pix())!, textColor: .white, textAlignment: .center)
        fuckLabel.text = "Common functions"
        return fuckLabel
    }()
    
    lazy var suckLabel: UILabel = {
        let suckLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18.pix())!, textColor: .white, textAlignment: .center)
        suckLabel.text = "Comparison of advantages"
        return suckLabel
    }()
    
    lazy var fuck1Label: UILabel = {
        let fuck1Label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 12.pix())!, textColor: .black, textAlignment: .left)
        fuck1Label.text = "Customer\nservice"
        fuck1Label.numberOfLines = 0
        return fuck1Label
    }()
    
    lazy var suck1Label: UILabel = {
        let suck1Label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 14.pix())!, textColor: .init(hexStr: "#FE4D39")!, textAlignment: .right)
        suck1Label.text = "Click >"
        return suck1Label
    }()
    
    lazy var fuck2Label: UILabel = {
        let fuck2Label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 12.pix())!, textColor: .black, textAlignment: .left)
        fuck2Label.text = "Certification"
        return fuck2Label
    }()
    
    lazy var suck2Label: UILabel = {
        let suck2Label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 14.pix())!, textColor: .init(hexStr: "#FE4D39")!, textAlignment: .right)
        suck2Label.text = "Click >"
        return suck2Label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(scrollerView)
        scrollerView.addSubview(oneImageView)
        oneImageView.addSubview(logoImageView)
        oneImageView.addSubview(nameLabel)
        oneImageView.addSubview(oneLabel)
        oneImageView.addSubview(moneyLabel)
        oneImageView.addSubview(twoLabel)
        oneImageView.addSubview(threeLabel)
        oneImageView.addSubview(fourLabel)
        oneImageView.addSubview(fiveLabel)
        scrollerView.addSubview(loanImageView)
        scrollerView.addSubview(desrightImageMainView)
        scrollerView.addSubview(whiteView)
        scrollerView.addSubview(twoImageView)
        twoImageView.addSubview(fuckLabel)
        scrollerView.addSubview(threeImageView)
        threeImageView.addSubview(fuck1Label)
        threeImageView.addSubview(suck1Label)
        scrollerView.addSubview(fourImageView)
        fourImageView.addSubview(fuck2Label)
        fourImageView.addSubview(suck2Label)
        scrollerView.addSubview(fiveImageView)
        fiveImageView.addSubview(suckLabel)
        scrollerView.addSubview(scrollMinView)
        scrollMinView.addSubview(sixImageView)
        scrollMinView.addSubview(sixLsImageView)
        scrollerView.addSubview(footImageView)
        loanImageView.addSubview(applyLabel)
        
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        oneImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(375.pix())
            make.height.equalTo(370.pix())
        }
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(130.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.left.equalTo(logoImageView.snp.right).offset(2.pix())
            make.height.equalTo(25)
        }
        oneLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(29.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(22.pix())
        }
        moneyLabel.snp.makeConstraints { make in
            make.top.equalTo(oneLabel.snp.top).offset(3.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(82.pix())
        }
        twoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(122.pix())
            make.top.equalToSuperview().offset(233.pix())
            make.height.equalTo(20.pix())
            make.width.equalTo(94.pix())
        }
        threeLabel.snp.makeConstraints { make in
            make.centerX.equalTo(twoLabel.snp.centerX)
            make.top.equalTo(twoLabel.snp.bottom).offset(2.pix())
            make.height.equalTo(20.pix())
        }
        fourLabel.snp.makeConstraints { make in
            make.left.equalTo(twoLabel.snp.right)
            make.top.equalTo(twoLabel.snp.top)
            make.height.equalTo(20)
        }
        fiveLabel.snp.makeConstraints { make in
            make.centerX.equalTo(fourLabel.snp.centerX)
            make.top.equalTo(fourLabel.snp.bottom).offset(2.pix())
            make.height.equalTo(20.pix())
        }
        loanImageView.snp.makeConstraints { make in
            make.top.equalTo(oneImageView.snp.bottom).offset(-25)
            make.left.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(96.pix())
        }
        desrightImageMainView.snp.makeConstraints { make in
            make.top.equalTo(loanImageView.snp.bottom)
            make.left.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(148.pix())
        }
        twoImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(desrightImageMainView.snp.bottom)
            make.size.equalTo(CGSize(width: 240.pix(), height: 54.pix()))
        }
        threeImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15.pix())
            make.top.equalTo(twoImageView.snp.bottom).offset(13)
            make.size.equalTo(CGSize(width: 168.pix(), height: 92.pix()))
        }
        fourImageView.snp.makeConstraints { make in
            make.left.equalTo(threeImageView.snp.right).offset(10.pix())
            make.top.equalTo(twoImageView.snp.bottom).offset(13)
            make.size.equalTo(CGSize(width: 168.pix(), height: 92.pix()))
        }
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(twoImageView.snp.top)
            make.left.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.bottom.equalTo(threeImageView.snp.bottom).offset(20)
        }
        fiveImageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(fourImageView.snp.bottom).offset(38)
            make.size.equalTo(CGSize(width: 310.pix(), height: 54.pix()))
        }
        scrollMinView.snp.makeConstraints { make in
            make.top.equalTo(fiveImageView.snp.bottom).offset(12.pix())
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: 233.pix()))
            make.centerX.equalToSuperview()
        }
        sixImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5.pix())
            make.top.bottom.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH - 10.pix())
        }
        sixLsImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(SCREEN_WIDTH + 5.pix())
            make.width.equalTo(SCREEN_WIDTH - 10.pix())
            make.right.equalToSuperview().offset(-5.pix())
        }
        footImageView.snp.makeConstraints { make in
            make.top.equalTo(scrollMinView.snp.bottom).offset(17.pix())
            make.size.equalTo(CGSize(width: 346.pix(), height: 280.pix()))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-95)
        }
        applyLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(160.pix())
            make.top.equalToSuperview()
            make.size.equalTo(CGSize(width: SCREEN_WIDTH - 185.pix(), height: 92.pix()))
        }
        fuckLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(40)
        }
        suckLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(40)
        }
        fuck1Label.snp.makeConstraints { make in
            make.width.equalTo(70.pix())
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
        }
        suck1Label.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.right.equalToSuperview().offset(-6)
            make.bottom.equalToSuperview().offset(-18)
        }
        fuck2Label.snp.makeConstraints { make in
            make.width.equalTo(100.pix())
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(20)
        }
        suck2Label.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.right.equalToSuperview().offset(-6)
            make.bottom.equalToSuperview().offset(-18)
        }
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let ruby = model.ruby ?? []
            for model in ruby {
                let bajada = model.bajada ?? ""
                if bajada == "allowing" {
                    let model = model.juices?.first
                    oneLabel.text = model?.aimed ?? ""
                    moneyLabel.text = model?.vain ?? ""
                    twoLabel.text = model?.perseveringly ?? ""
                    threeLabel.text = model?.entangle ?? ""
                    fourLabel.text = model?.shropshire ?? ""
                    fiveLabel.text = model?.cutting ?? ""
                    let applyStr = model?.thrusts ?? ""
                    applyLabel.text = "\(applyStr) >"
                    nameLabel.text = model?.pitying ?? ""
                    let logoUrl = URL(string: model?.antagonist ?? "")
                    logoImageView.kf.setImage(with: logoUrl)
                }
            }
        }).disposed(by: disposeBag)
        
        loanImageView.rx.tapGesture().subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.applyBlock?()
        }).disposed(by: disposeBag)
        
        setupGradient()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bgView.bounds
        let topSafeArea = self.safeAreaInsets.top
        logoImageView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(topSafeArea - 8.pix())
        }
    }
    
    private func setupGradient() {
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hexStr: "#FFF1CB")!.cgColor,
            UIColor(hexStr: "#FFDEA4")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        bgView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
