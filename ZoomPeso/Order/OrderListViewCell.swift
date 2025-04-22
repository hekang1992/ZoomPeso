//
//  OrderListViewCell.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit

class OrderListViewCell: BaseViewCell {

    lazy var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        cellImageView.image = UIImage(named: "celliamge")
        return cellImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImageView)
        cellImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 372.pix(), height: 183.pix()))
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
