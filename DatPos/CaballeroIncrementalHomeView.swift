
import UIKit
import RxRelay
import FSPagerView

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

class CaballeroIncrementalHomeView: BaseView {
    
    var redrapeBlock: (() -> Void)?
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    private var windowsLayer: CAGradientLayer!
    
    lazy var architectureView: UIView = {
        let architectureView = UIView()
        return architectureView
    }()
    
    lazy var scrollerView: UIScrollView = {
        let scrollerView = UIScrollView()
        scrollerView.showsHorizontalScrollIndicator = false
        scrollerView.showsVerticalScrollIndicator = false
        scrollerView.contentInsetAdjustmentBehavior = .never
        return scrollerView
    }()
    
    lazy var oamView: UIImageView = {
        let oamView = UIImageView()
        oamView.image = UIImage(named: "httpAddOmeimage")
        oamView.isUserInteractionEnabled = true
        return oamView
    }()
    
    lazy var qbasicView: UIImageView = {
        let qbasicView = UIImageView()
        qbasicView.layer.cornerRadius = 5
        qbasicView.layer.masksToBounds = true
        return qbasicView
    }()
    
    lazy var nabobessLabel: UILabel = {
        let nabobessLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18.pix(), weight: .semibold), textColor: .white, textAlignment: .left)
        return nabobessLabel
    }()
    
    lazy var pacesetterLabel: UILabel = {
        let pacesetterLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 50.pix())!, textColor: .init(cssStr: "#FFFFFF")!, textAlignment: .left)
        return pacesetterLabel
    }()
    
    
    lazy var babassuLabel: UILabel = {
        let babassuLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(cssStr: "#000001")!, textAlignment: .center)
        return babassuLabel
    }()
    
    lazy var combinatorialLabel: UILabel = {
        let combinatorialLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(cssStr: "#000001")!, textAlignment: .center)
        return combinatorialLabel
    }()
    
    lazy var labialView: UIImageView = {
        let labialView = UIImageView()
        labialView.image = UIImage(named: "actionImgLoaiimge")
        labialView.isUserInteractionEnabled = true
        return labialView
    }()
    
    lazy var ubeView: UIImageView = {
        let ubeView = UIImageView()
        ubeView.image = UIImage(named: "childRightThreeimage")
        return ubeView
    }()
    
    lazy var jitView: UIImageView = {
        let jitView = UIImageView()
        jitView.image = UIImage(named: "check_kefui_amge")
        jitView.isUserInteractionEnabled = true
        return jitView
    }()
    
    lazy var oakmossBtn: UIButton = {
        let oakmossBtn = UIButton()
        return oakmossBtn
    }()
    
    lazy var eventBtn: UIButton = {
        let eventBtn = UIButton()
        return eventBtn
    }()
    
    lazy var rabbinView: UIView = {
        let rabbinView = UIView()
        rabbinView.backgroundColor = .white
        rabbinView.layer.cornerRadius = 10.pix()
        rabbinView.layer.masksToBounds = true
        return rabbinView
    }()
    
    lazy var saxView: UIView = {
        let saxView = UIView()
        saxView.layer.cornerRadius = 25.pix()
        saxView.layer.borderWidth = 1.pix()
        saxView.layer.borderColor = UIColor.init(cssStr: "#7B2306")!.cgColor
        saxView.backgroundColor = UIColor.init(cssStr: "#FE5255")
        return saxView
    }()
    
    lazy var loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.textColor = .white
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont.boldSystemFont(ofSize: 30)
        return loginLabel
    }()
    
    lazy var delegateLabel: UILabel = {
        let delegateLabel = UILabel()
        delegateLabel.text = "Application " + "Process"
        delegateLabel.textColor = .black
        delegateLabel.textAlignment = .left
        delegateLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return delegateLabel
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
        addSubview(architectureView)
        addSubview(scrollerView)
        scrollerView.addSubview(oamView)
        oamView.addSubview(qbasicView)
        oamView.addSubview(nabobessLabel)
        oamView.addSubview(pacesetterLabel)
        oamView.addSubview(babassuLabel)
        oamView.addSubview(combinatorialLabel)
        oamView.addSubview(saxView)
        saxView.addSubview(loginLabel)
        scrollerView.addSubview(labialView)
        scrollerView.addSubview(ubeView)
        scrollerView.addSubview(jitView)
        scrollerView.addSubview(rabbinView)
        rabbinView.addSubview(delegateLabel)
        
        architectureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        oamView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(375.pix())
            make.height.equalTo(370.pix())
        }
        qbasicView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(130.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        nabobessLabel.snp.makeConstraints { make in
            make.centerY.equalTo(qbasicView.snp.centerY)
            make.left.equalTo(qbasicView.snp.right).offset(2.pix())
            make.height.equalTo(25)
        }
        
        pacesetterLabel.snp.makeConstraints { make in
            make.top.equalTo(nabobessLabel.snp.bottom).offset(60.pix())
            make.left.equalToSuperview().offset(41.pix())
            make.height.equalTo(82.pix())
        }
        
        babassuLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(126.pix())
            make.top.equalTo(nabobessLabel.snp.bottom).offset(33.pix())
            make.height.equalTo(20.pix())
        }
        
        combinatorialLabel.snp.makeConstraints { make in
            make.left.equalTo(babassuLabel.snp.right).offset(20.pix())
            make.top.equalTo(nabobessLabel.snp.bottom).offset(33.pix())
            make.height.equalTo(20.pix())
        }
        labialView.snp.makeConstraints { make in
            make.top.equalTo(oamView.snp.bottom).offset(-25)
            make.centerX.equalToSuperview()
            make.width.equalTo(345.pix())
            make.height.equalTo(105.pix())
        }
        ubeView.snp.makeConstraints { make in
            make.top.equalTo(labialView.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.width.equalTo(344.pix())
            make.height.equalTo(165.pix())
        }
        jitView.snp.makeConstraints { make in
            make.top.equalTo(ubeView.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.width.equalTo(344.pix())
            make.height.equalTo(105.pix())
        }
        
        jitView.addSubview(oakmossBtn)
        jitView.addSubview(eventBtn)
        
        oakmossBtn.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(55.pix())
        }
        
        eventBtn.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(55.pix())
        }
        
        rabbinView.snp.makeConstraints { make in
            make.top.equalTo(jitView.snp.bottom).offset(20.pix())
            make.centerX.equalToSuperview()
            make.width.equalTo(344.pix())
            make.height.equalTo(201.pix())
            make.bottom.equalToSuperview().offset(-95.pix())
        }
        saxView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30.pix())
            make.size.equalTo(CGSize(width: 220.pix(), height: 54.pix()))
            make.bottom.equalToSuperview().offset(-48.pix())
        }
        loginLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        delegateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9.pix())
            make.left.equalToSuperview().offset(14.pix())
            make.height.equalTo(25.pix())
        }
        rabbinView.addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.top.equalTo(delegateLabel.snp.bottom).offset(9)
            make.left.bottom.right.equalToSuperview()
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let ruby = model.ruby ?? []
            for model in ruby {
                let bajada = model.bajada ?? ""
                if bajada == "allowing" {
                    let model = model.juices?.first
                    pacesetterLabel.text = model?.vain ?? ""
                    babassuLabel.text = model?.entangle ?? ""
                    combinatorialLabel.text = model?.cutting ?? ""
                    let jabberwockyStr = model?.thrusts ?? ""
                    loginLabel.text = jabberwockyStr
                    nabobessLabel.text = model?.pitying ?? ""
                    let sabaothUrl = URL(string: model?.antagonist ?? "")!
                    qbasicView.af.setImage(withURL: sabaothUrl)
                }
            }
        }).disposed(by: identifierBag)
        
        oamView.rx.tapGesture().subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.redrapeBlock?()
        }).disposed(by: identifierBag)
        
        labialView.rx.tapGesture().subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.redrapeBlock?()
        }).disposed(by: identifierBag)
        
        enumFactoringMacaber()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        windowsLayer.frame = architectureView.bounds
        let grantArea = self.safeAreaInsets.top
        qbasicView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(grantArea - 8.pix())
        }
        
    }
    
    private func enumFactoringMacaber() {
        windowsLayer = CAGradientLayer()
        windowsLayer.colors = [
            UIColor(cssStr: "#83D1FE")!.cgColor,
            UIColor(cssStr: "#46A4FF")!.cgColor
        ]
        windowsLayer.startPoint = CGPoint(x: 0, y: 0)
        windowsLayer.endPoint = CGPoint(x: 1, y: 1)
        architectureView.layer.insertSublayer(windowsLayer, at: 0)
    }
    
    func isIPad() -> Bool {
        let model = UIDevice.current.model
        return model.lowercased().contains("ipad")
    }
    
}

extension CaballeroIncrementalHomeView: FSPagerViewDelegate, FSPagerViewDataSource {
    
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
