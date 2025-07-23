//
//  HomeView.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import RxRelay
import FSPagerView

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
        oneImageView.isUserInteractionEnabled = true
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
    
    lazy var moneyLabel: UILabel = {
        let moneyLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 50.pix())!, textColor: .init(hexStr: "#FFFFFF")!, textAlignment: .left)
        return moneyLabel
    }()
    
    
    lazy var threeLabel: UILabel = {
        let threeLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(hexStr: "#000001")!, textAlignment: .center)
        return threeLabel
    }()
    
    lazy var fiveLabel: UILabel = {
        let fiveLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(hexStr: "#000001")!, textAlignment: .center)
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
        twoImageView.image = UIImage(named: "kefui_amge")
        twoImageView.isUserInteractionEnabled = true
        return twoImageView
    }()
    
    lazy var oneBtn: UIButton = {
        let oneBtn = UIButton()
        return oneBtn
    }()
    
    lazy var twoBtn: UIButton = {
        let twoBtn = UIButton()
        return twoBtn
    }()
    
    lazy var whiteView: UIView = {
        let whiteView = UIView()
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = 10.pix()
        whiteView.layer.masksToBounds = true
        return whiteView
    }()
    
    lazy var appView: UIView = {
        let appView = UIView()
        appView.layer.cornerRadius = 25.pix()
        appView.layer.borderWidth = 1.pix()
        appView.layer.borderColor = UIColor.init(hexStr: "#7B2306")!.cgColor
        appView.backgroundColor = UIColor.init(hexStr: "#FE5255")
        return appView
    }()
    
    lazy var applyLabel: UILabel = {
        let applyLabel = UILabel()
        applyLabel.textColor = .white
        applyLabel.textAlignment = .center
        applyLabel.font = UIFont.boldSystemFont(ofSize: 30)
        return applyLabel
    }()
    
    lazy var proLabel: UILabel = {
        let proLabel = UILabel()
        proLabel.text = "Application " + "Process"
        proLabel.textColor = .black
        proLabel.textAlignment = .left
        proLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return proLabel
    }()
    
    lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView(frame: .zero)
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
        pagerView.isInfinite = true
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        pagerView.itemSize = CGSize(width: 340.pix(), height: 160.pix())
        pagerView.interitemSpacing = 15.pix()
        pagerView.automaticSlidingInterval = 3.0 
        return pagerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(scrollerView)
        scrollerView.addSubview(oneImageView)
        oneImageView.addSubview(logoImageView)
        oneImageView.addSubview(nameLabel)
        oneImageView.addSubview(moneyLabel)
        oneImageView.addSubview(threeLabel)
        oneImageView.addSubview(fiveLabel)
        oneImageView.addSubview(appView)
        appView.addSubview(applyLabel)
        scrollerView.addSubview(loanImageView)
        scrollerView.addSubview(desrightImageMainView)
        scrollerView.addSubview(twoImageView)
        scrollerView.addSubview(whiteView)
        whiteView.addSubview(proLabel)
        
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
        
        moneyLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(60.pix())
            make.left.equalToSuperview().offset(41.pix())
            make.height.equalTo(82.pix())
        }
        
        threeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(126.pix())
            make.top.equalTo(nameLabel.snp.bottom).offset(33.pix())
            make.height.equalTo(20.pix())
        }
        
        fiveLabel.snp.makeConstraints { make in
            make.left.equalTo(threeLabel.snp.right).offset(20.pix())
            make.top.equalTo(nameLabel.snp.bottom).offset(33.pix())
            make.height.equalTo(20.pix())
        }
        loanImageView.snp.makeConstraints { make in
            make.top.equalTo(oneImageView.snp.bottom).offset(-25)
            make.centerX.equalToSuperview()
            make.width.equalTo(345.pix())
            make.height.equalTo(105.pix())
        }
        desrightImageMainView.snp.makeConstraints { make in
            make.top.equalTo(loanImageView.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.width.equalTo(344.pix())
            make.height.equalTo(165.pix())
        }
        twoImageView.snp.makeConstraints { make in
            make.top.equalTo(desrightImageMainView.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.width.equalTo(344.pix())
            make.height.equalTo(105.pix())
        }
        
        twoImageView.addSubview(oneBtn)
        twoImageView.addSubview(twoBtn)
        
        oneBtn.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(55.pix())
        }
        
        twoBtn.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(55.pix())
        }
        
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(twoImageView.snp.bottom).offset(20.pix())
            make.centerX.equalToSuperview()
            make.width.equalTo(344.pix())
            make.height.equalTo(201.pix())
            make.bottom.equalToSuperview().offset(-95.pix())
        }
        appView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30.pix())
            make.size.equalTo(CGSize(width: 220.pix(), height: 54.pix()))
            make.bottom.equalToSuperview().offset(-48.pix())
        }
        applyLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        proLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9.pix())
            make.left.equalToSuperview().offset(14.pix())
            make.height.equalTo(25.pix())
        }
        whiteView.addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.top.equalTo(proLabel.snp.bottom).offset(9)
            make.left.bottom.right.equalToSuperview()
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let ruby = model.ruby ?? []
            for model in ruby {
                let bajada = model.bajada ?? ""
                if bajada == "allowing" {
                    let model = model.juices?.first
                    moneyLabel.text = model?.vain ?? ""
                    threeLabel.text = model?.entangle ?? ""
                    fiveLabel.text = model?.cutting ?? ""
                    let applyStr = model?.thrusts ?? ""
                    applyLabel.text = applyStr
                    nameLabel.text = model?.pitying ?? ""
                    let logoUrl = URL(string: model?.antagonist ?? "")
                    logoImageView.kf.setImage(with: logoUrl)
                }
            }
        }).disposed(by: disposeBag)
        
        oneImageView.rx.tapGesture().subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.applyBlock?()
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
            UIColor(hexStr: "#83D1FE")!.cgColor,
            UIColor(hexStr: "#46A4FF")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        bgView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func isIPad() -> Bool {
        let model = UIDevice.current.model
        return model.lowercased().contains("ipad")
    }
    
}

extension HomeView: FSPagerViewDelegate, FSPagerViewDataSource {
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let imageArray = ["banner_1", "banner_2", "banner_3"]
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FSPagerViewCell", at: index)
        cell.imageView?.image = UIImage(named: imageArray[index])
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 3
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
    
}
