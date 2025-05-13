//
//  CenterListViewCell.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/27.
//

import UIKit

class CenterListViewCell: BaseViewCell {
    
    lazy var bgCenterView: UIView = {
        let bgCenterView = UIView()
        return bgCenterView
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 38.pix()
        bgView.layer.masksToBounds = true
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.white.cgColor
        return bgView
    }()
    
    lazy var listImageView: UIImageView = {
        let listImageView = UIImageView()
        return listImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 17)!, textColor: UIColor.init(hexStr: "#712202")!, textAlignment: .left)
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgCenterView)
        bgCenterView.addSubview(bgView)
        bgCenterView.addSubview(listImageView)
        bgView.addSubview(nameLabel)
        bgCenterView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.pix())
            make.size.equalTo(CGSize(width: 346.pix(), height: 91.pix()))
            make.centerX.equalToSuperview()
        }
        bgView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(75.pix())
        }
        listImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.size.equalTo(CGSize(width: 82.pix(), height: 82.pix()))
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(21.pix())
            make.left.equalToSuperview().offset(130.pix())
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CenterListViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let endColor = UIColor.white.withAlphaComponent(0.5).cgColor
        applyGradient(to: bgView, colors: [UIColor.init(hexStr: "#FFD119")!.cgColor, endColor])
        
    }
    
    func applyGradient(to view: UIView, colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = colors
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
