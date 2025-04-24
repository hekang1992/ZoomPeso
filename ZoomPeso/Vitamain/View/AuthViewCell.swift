//
//  AuthViewCell.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/23.
//

import UIKit

class AuthViewCell: BaseViewCell {
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .init(hexStr: "#FFF5C3")
        bgView.layer.cornerRadius = 10
        return bgView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .medium), textColor: .init(hexStr: "#E2D38B")!, textAlignment: .left)
        return nameLabel
    }()
    
    lazy var cImageView: UIImageView = {
        let cImageView = UIImageView()
        cImageView.image = UIImage(named: "rightimagebal")
        return cImageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(cImageView)
        
        bgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(11.5)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(200.pix())
            make.height.equalTo(21)
            make.bottom.equalToSuperview().offset(-16.5)
        }
        
        cImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-30)
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
