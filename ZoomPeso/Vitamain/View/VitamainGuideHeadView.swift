//
//  VitamainGuideHeadView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit

class VitamainGuideHeadView: BaseView {
    
    var backBlock: (() -> Void)?

    lazy var backBtn: UIButton = {
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(UIImage(named: "backimage"), for: .normal)
        return backBtn
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18.pix())!, textColor: .black, textAlignment: .center)
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backBtn)
        addSubview(nameLabel)
        backBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(7.pix())
            make.size.equalTo(CGSize(width: 40.pix(), height: 40.pix()))
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backBtn.snp.centerY)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 250.pix(), height: 40.pix()))
        }
        
        backBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.backBlock?()
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
