//
//  AccDelLogView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/27.
//

import UIKit

class AccDelLogView: BaseView {
    
    var block: ((String) -> Void)?

    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "degimge")
        ctImageView.isUserInteractionEnabled = true
        return ctImageView
    }()
    
    lazy var sureBtn: UIButton = {
        let sureBtn = UIButton(type: .custom)
        return sureBtn
    }()
    
    lazy var cancelBtn: UIButton = {
        let cancelBtn = UIButton(type: .custom)
        return cancelBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(ctImageView)
        ctImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 278.pix(), height: 518.pix()))
        }
        
        ctImageView.addSubview(sureBtn)
        ctImageView.addSubview(cancelBtn)
        
        cancelBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 25, height: 25))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        sureBtn.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(cancelBtn.snp.top).offset(-50.pix())
            make.height.equalTo(50)
        }
        
        cancelBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.block?("0")
        }).disposed(by: disposeBag)
        
        sureBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.block?("1")
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
