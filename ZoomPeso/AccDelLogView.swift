//
//  AccDelLogView.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/27.
//

import UIKit

class AccDelLogView: BaseView {
    
    var block: ((String) -> Void)?

    lazy var vindaImageView: UIImageView = {
        let vindaImageView = UIImageView()
        vindaImageView.image = UIImage(named: "degimge")
        vindaImageView.isUserInteractionEnabled = true
        return vindaImageView
    }()
    
    lazy var sureBtn: UIButton = {
        let sureBtn = UIButton(type: .custom)
        return sureBtn
    }()
    
    lazy var cancelBtn: UIButton = {
        let cancelBtn = UIButton(type: .custom)
        return cancelBtn
    }()
    
    lazy var cycleBtn: UIButton = {
        let cycleBtn = UIButton(type: .custom)
        cycleBtn.setImage(UIImage(named: "cyclenormail"), for: .normal)
        cycleBtn.setImage(UIImage(named: "cycleselect"), for: .selected)
        return cycleBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(vindaImageView)
        vindaImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 278.pix(), height: 518.pix()))
        }
        
        vindaImageView.addSubview(sureBtn)
        vindaImageView.addSubview(cancelBtn)
        vindaImageView.addSubview(cycleBtn)
        
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
        
        cycleBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-140.pix())
            make.left.equalToSuperview().offset(20.pix())
            make.size.equalTo(CGSize(width: 22.pix(), height: 22.pix()))
        }
        
        cancelBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.block?("0")
        }).disposed(by: disposeBag)
        
        sureBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            if cycleBtn.isSelected == false {
                ToastManagerConfig.showToastText(form: self, message: "Please read and confirm the account cancellation agreement.")
                return
            }
            self.block?("1")
        }).disposed(by: disposeBag)
        
        cycleBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            cycleBtn.isSelected.toggle()
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
