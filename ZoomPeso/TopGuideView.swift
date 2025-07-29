//
//  TopGuideView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/7/29.
//

import UIKit
import FSPagerView

class TopGuideView: BaseView {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
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
        let moneyLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 59)!, textColor: .init(cssHexStr: "#712202")!, textAlignment: .left)
        return moneyLabel
    }()
    
    lazy var rightLabel: UILabel = {
        let rightLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .init(cssHexStr: "#F9732C")!, textAlignment: .center)
        return rightLabel
    }()
    
    lazy var leftLabel: UILabel = {
        let leftLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .init(cssHexStr: "#F9732C")!, textAlignment: .center)
        return leftLabel
    }()
    
    lazy var descLabel: UILabel = {
        let descLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .init(cssHexStr: "#FFFFFF")!, textAlignment: .center)
        descLabel.text = "Certifcation conditions"
        return descLabel
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.setTitle("Go Loan >", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18.pix())
        nextBtn.backgroundColor = .init(cssHexStr: "#FF3825")
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.layer.cornerRadius = 23.5
        nextBtn.layer.borderWidth = 2
        nextBtn.layer.borderColor = UIColor.init(cssHexStr: "#FCE69B")?.cgColor
        return nextBtn
    }()
    
    lazy var footImageView: UIImageView = {
        let footImageView = UIImageView()
        footImageView.image = UIImage(named: "dizuoimge")
        footImageView.isUserInteractionEnabled = true
        return footImageView
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
        scrollView.addSubview(oneImageView)
        oneImageView.addSubview(moneyLabel)
        oneImageView.addSubview(rightLabel)
        oneImageView.addSubview(leftLabel)
        oneImageView.addSubview(twoImageView)
        oneImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
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
        twoImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(151.pix())
        }
        
        scrollView.addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(twoImageView.snp.bottom)
            make.left.equalToSuperview().offset(12)
            make.height.equalTo(25.pix())
        }
        
        scrollView.addSubview(footImageView)
        footImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 350.pix(), height: 396.pix()))
            make.top.equalTo(descLabel.snp.bottom).offset(10)
        }
        
        scrollView.addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.top.equalTo(footImageView.snp.top).offset(20.pix())
            make.width.equalTo(SCREEN_WIDTH)
            make.left.equalToSuperview()
            make.height.equalTo(222.pix())
        }
        
        scrollView.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.top.equalTo(footImageView.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.bottom.equalToSuperview().offset(-20.pix())
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
