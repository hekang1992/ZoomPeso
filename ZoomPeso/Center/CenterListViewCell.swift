//
//  CenterListViewCell.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/27.
//

import UIKit

class CenterListViewCell: BaseViewCell {
    
    lazy var listImageView: UIImageView = {
        let listImageView = UIImageView()
        listImageView.contentMode = .scaleAspectFit
        listImageView.image = UIImage(named: "onelaige")
        return listImageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(listImageView)
        listImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.pix())
            make.size.equalTo(CGSize(width: 346.pix(), height: 91.pix()))
            make.centerX.equalToSuperview()
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
