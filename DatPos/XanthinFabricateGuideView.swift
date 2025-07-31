
import UIKit
import FSPagerView

class XanthinFabricateGuideView: BaseView {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    lazy var oamView: UIImageView = {
        let oamView = UIImageView()
        oamView.image = UIImage(named: "tableBgMoiamgeey")
        return oamView
    }()
    
    lazy var jitView: UIImageView = {
        let jitView = UIImageView()
        jitView.image = UIImage(named: "alphabetizeImgCofimge")
        return jitView
    }()
    
    lazy var pacesetterLabel: UILabel = {
        let pacesetterLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 59)!, textColor: .init(cssStr: "#712202")!, textAlignment: .left)
        return pacesetterLabel
    }()
    
    lazy var translationLabel: UILabel = {
        let translationLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .init(cssStr: "#F9732C")!, textAlignment: .center)
        return translationLabel
    }()
    
    lazy var iadLabel: UILabel = {
        let iadLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .init(cssStr: "#F9732C")!, textAlignment: .center)
        return iadLabel
    }()
    
    lazy var itemLabel: UILabel = {
        let itemLabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18)!, textColor: .init(cssStr: "#FFFFFF")!, textAlignment: .center)
        itemLabel.text = "Certifcation conditions"
        return itemLabel
    }()
    
    lazy var qandaharBtn: UIButton = {
        let qandaharBtn = UIButton(type: .custom)
        qandaharBtn.setTitle("Go Loan >", for: .normal)
        qandaharBtn.titleLabel?.font = UIFont(name: kafFont, size: 18.pix())
        qandaharBtn.backgroundColor = .init(cssStr: "#FF3825")
        qandaharBtn.setTitleColor(.white, for: .normal)
        qandaharBtn.layer.cornerRadius = 23.5
        qandaharBtn.layer.borderWidth = 2
        qandaharBtn.layer.borderColor = UIColor.init(cssStr: "#FCE69B")?.cgColor
        return qandaharBtn
    }()
    
    lazy var caballoView: UIImageView = {
        let caballoView = UIImageView()
        caballoView.image = UIImage(named: "dirtyBackDizuoimge")
        caballoView.isUserInteractionEnabled = true
        return caballoView
    }()
    
    lazy var pagerView: FSPagerView = {
        let pagerView = FSPagerView(frame: .zero)
        
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
        pagerView.isInfinite = true
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        pagerView.itemSize = CGSize(width: 210.pix(), height: 222.pix())
        pagerView.interitemSpacing = 15.pix()
        return pagerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.addSubview(oamView)
        oamView.addSubview(pacesetterLabel)
        oamView.addSubview(translationLabel)
        oamView.addSubview(iadLabel)
        oamView.addSubview(jitView)
        oamView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(283.pix())
        }
        pacesetterLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(48.pix())
            make.bottom.equalToSuperview().offset(-57.pix())
            make.height.equalTo(62.pix())
        }
        translationLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10.pix())
            make.top.equalToSuperview().offset(97.pix())
            make.width.equalTo(80.pix())
            make.height.equalTo(25)
        }
        iadLabel.snp.makeConstraints { make in
            make.top.equalTo(translationLabel.snp.top)
            make.right.equalTo(translationLabel.snp.left).offset(-10.pix())
            make.height.equalTo(25)
            make.width.equalTo(121.pix())
        }
        jitView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(151.pix())
        }
        
        scrollView.addSubview(itemLabel)
        itemLabel.snp.makeConstraints { make in
            make.top.equalTo(jitView.snp.bottom)
            make.left.equalToSuperview().offset(12)
            make.height.equalTo(25.pix())
        }
        
        scrollView.addSubview(caballoView)
        caballoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 350.pix(), height: 396.pix()))
            make.top.equalTo(itemLabel.snp.bottom).offset(10)
        }
        
        scrollView.addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.top.equalTo(caballoView.snp.top).offset(20.pix())
            make.width.equalTo(SCREEN_WIDTH)
            make.left.equalToSuperview()
            make.height.equalTo(222.pix())
        }
        
        scrollView.addSubview(qandaharBtn)
        qandaharBtn.snp.makeConstraints { make in
            make.top.equalTo(caballoView.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.bottom.equalToSuperview().offset(-20.pix())
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
