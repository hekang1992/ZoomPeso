//
//  BaseView.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {
    let disposeBag = DisposeBag()
}

class BaseViewCell: UITableViewCell {
    let disposeBag = DisposeBag()
}

class BaseView: UIView {
    let disposeBag = DisposeBag()
}

class EmptyView: UIView {
    lazy var emptyImageView: UIImageView = {
        let emptyImageView = UIImageView()
        emptyImageView.image = UIImage(named: "emputiamge")
        return emptyImageView
    }()
    
    lazy var emptyLabel: UILabel = {
        let emptyLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .medium), textColor: .init(hexStr: "#FFA220")!, textAlignment: .center)
        emptyLabel.text = "You have no orders"
        return emptyLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(emptyImageView)
        addSubview(emptyLabel)
        emptyImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalTo((SCREEN_WIDTH - 222.pix()) * 0.5)
            make.size.equalTo(CGSize(width: 222.pix(), height: 169.pix()))
        }
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImageView.snp.bottom)
            make.centerX.equalTo(emptyImageView.snp.centerX)
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
