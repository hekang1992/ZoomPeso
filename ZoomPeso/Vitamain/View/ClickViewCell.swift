//
//  ClickViewCell.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/25.
//

import UIKit
import RxRelay

class ClickViewCell: BaseViewCell {
    
    var model = BehaviorRelay<interceptModel?>(value: nil)
    
    var clickBlock: ((UILabel) -> Void)?
    
    lazy var desclabel: UILabel = {
        let desclabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return desclabel
    }()

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .init(hexStr: "#FFF5C3")
        bgView.layer.cornerRadius = 10.pix()
        bgView.layer.masksToBounds = true
        bgView.isUserInteractionEnabled = true
        return bgView
    }()
    
    lazy var rightImageView: UIImageView = {
        let rightImageView = UIImageView()
        rightImageView.image = UIImage(named: "rightimagebal")
        return rightImageView
    }()
    
    lazy var clickLabel: UILabel = {
        let clickLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15.pix(), weight: .medium), textColor: .init(hexStr: "#E2D38B")!, textAlignment: .left)
        clickLabel.numberOfLines = 0
        return clickLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(desclabel)
        contentView.addSubview(bgView)
        bgView.addSubview(rightImageView)
        bgView.addSubview(clickLabel)
        
        desclabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.pix())
            make.left.equalToSuperview().offset(12.pix())
            make.height.equalTo(21.pix())
            make.bottom.equalToSuperview().offset(-50.pix())
        }
        
        bgView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(desclabel.snp.bottom).offset(5.pix())
            make.left.equalTo(desclabel.snp.left)
            make.height.equalTo(44.pix())
        }
        
        rightImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5.pix())
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
        
        clickLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.pix())
            make.right.equalTo(rightImageView.snp.left).offset(-2.pix())
            make.height.equalTo(44.pix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            desclabel.text = model.backs ?? ""
            let common = model.common ?? ""
            if common.isEmpty {
                clickLabel.text = model.tuft ?? ""
                clickLabel.textColor = .init(hexStr: "#E2D38B")
            }else {
                clickLabel.text = common
                clickLabel.textColor = .init(hexStr: "#FF3824")
            }
        }).disposed(by: disposeBag)
        
        bgView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.clickBlock?(clickLabel)
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
