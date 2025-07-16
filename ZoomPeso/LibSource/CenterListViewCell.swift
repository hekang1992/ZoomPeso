//
//  CenterListViewCell.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/27.
//

import UIKit

class CenterListViewCell: BaseViewCell {
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "cell_imged_f")
        return bgImageView
    }()
    
    lazy var listImageView: UIImageView = {
        let listImageView = UIImageView()
        return listImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 17)!, textColor: UIColor.init(hexStr: "#000001")!, textAlignment: .left)
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgImageView)
        bgImageView.addSubview(listImageView)
        bgImageView.addSubview(nameLabel)
        
        
        bgImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 345.pix(), height: 95.pix()))
        }
       
        listImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16.pix())
            make.left.equalToSuperview().offset(14.pix())
            make.size.equalTo(CGSize(width: 30.pix(), height: 30.pix()))
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(listImageView.snp.centerY)
            make.height.equalTo(21.pix())
            make.left.equalTo(listImageView.snp.right).offset(35.pix())
        }
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
