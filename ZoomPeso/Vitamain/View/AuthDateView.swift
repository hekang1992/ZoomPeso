//
//  AuthDateView.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/27.
//

import UIKit

class AuthDateView: BaseView {
    
    var saveBlock: ((String) -> Void)?
    
    var selectStr: String = ""
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        return bgView
    }()
    
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "timeadage")
        bgImageView.isUserInteractionEnabled = true
        return bgImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .black, textAlignment: .center)
        mlabel.text = "Please select a time"
        return mlabel
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.setTitle("Confirm", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18.pix())
        nextBtn.backgroundColor = .init(hexStr: "#FF3824")
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.layer.cornerRadius = 23.5
        return nextBtn
    }()
    
    lazy var cancelBtn: UIButton = {
        let cancelBtn = UIButton(type: .custom)
        cancelBtn.setImage(UIImage(named: "cencelximge"), for: .normal)
        return cancelBtn
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "en_PH")
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        return datePicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(bgImageView)
        bgImageView.addSubview(mlabel)
        bgImageView.addSubview(datePicker)
        addSubview(nextBtn)
        addSubview(cancelBtn)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        bgImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 288.pix(), height: 299.pix()))
        }
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
            make.left.equalToSuperview()
        }
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.top.equalTo(bgImageView.snp.bottom).offset(-30.pix())
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nextBtn.snp.bottom).offset(55.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        datePicker.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mlabel.snp.bottom).offset(21.pix())
            make.left.equalToSuperview().offset(13.pix())
            make.height.equalTo(215.pix())
        }
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.saveBlock?(selectStr)
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = Locale(identifier: "en_PH")
        let selectedDate = sender.date
        let formattedDate = formatter.string(from: selectedDate)
        self.selectStr = formattedDate
        print(formattedDate)
    }
    
}
