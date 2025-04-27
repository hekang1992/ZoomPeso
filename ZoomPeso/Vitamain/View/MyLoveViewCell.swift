//
//  MyLoveViewCell.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/25.
//

import UIKit
import RxRelay
import ASGradientLabel

class MyLoveViewCell: BaseViewCell {
    
    var model = BehaviorRelay<armyModel?>(value: nil)
    
    lazy var desclabel: ASGradientLabel = {
        let desclabel = ASGradientLabel()
        desclabel.startPoint = CGPoint(x: 0, y: 0.5)
        desclabel.endPoint = CGPoint(x: 1, y: 0.5)
        desclabel.locations = [0 ,1]
        desclabel.colors = [UIColor.init(hexStr: "#FF3824")!.cgColor, UIColor.init(hexStr: "#FF992F")!.cgColor]
        return desclabel
    }()

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .init(hexStr: "#FFFAED")
        bgView.layer.cornerRadius = 10.pix()
        bgView.layer.masksToBounds = true
        bgView.layer.shadowColor = UIColor.init(hexStr: "#B42400")?.withAlphaComponent(0.27).cgColor
        bgView.layer.shadowOffset = CGSize(width: 0, height: -3.5)
        bgView.layer.shadowRadius = 6.5
        bgView.layer.shadowOpacity = 0.2
        bgView.layer.masksToBounds = false
        return bgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(desclabel)
        bgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 345.pix(), height: 218.pix()))
        }
        desclabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16.pix())
            make.left.equalToSuperview().offset(13.pix())
            make.height.equalTo(21.pix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let backs = NSMutableAttributedString(string: model.backs ?? "")
            let range = NSRange(location: 0, length: backs.length)
            backs.addAttributes([.font: UIFont(name: ArialBlackFont, size: 15)!], range: range)
            desclabel.attributedText = backs
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

