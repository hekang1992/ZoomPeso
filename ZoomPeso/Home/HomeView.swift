//
//  HomeView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit

class HomeView: BaseView {

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

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(scrollerView)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        setupGradient()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bgView.bounds
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
