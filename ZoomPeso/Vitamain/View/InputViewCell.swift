//
//  InputViewCell.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/25.
//

import UIKit
import RxRelay
import RxSwift

class InputViewCell: BaseViewCell {
    
    var model = BehaviorRelay<interceptModel?>(value: nil)
    
    lazy var desclabel: UILabel = {
        let desclabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return desclabel
    }()

    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .init(hexStr: "#FFF5C3")
        bgView.layer.cornerRadius = 10.pix()
        bgView.layer.masksToBounds = true
        return bgView
    }()
    
    lazy var inputTx: UITextField = {
        let inputTx = UITextField()
        inputTx.textColor = .init(hexStr: "#FF3824")
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 15.pix(), weight: .medium)
        ]
        inputTx.attributedPlaceholder = NSAttributedString(
            string: "",
            attributes: placeholderAttributes
        )
        return inputTx
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(desclabel)
        contentView.addSubview(bgView)
        bgView.addSubview(inputTx)
        
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
        
        inputTx.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.pix())
            make.right.equalToSuperview().offset(-2.pix())
            make.height.equalTo(44.pix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            desclabel.text = model.backs ?? ""
            let common = model.common ?? ""
            let hound = model.hound ?? ""
            if common.isEmpty {
                if hound.isEmpty {
                    inputTx.text = ""
                }else {
                    inputTx.text = hound
                }
            }else {
                inputTx.text = common
            }
            inputTx.attributedPlaceholder = NSAttributedString(string: model.tuft ?? "")
            let files = model.files ?? 0
            self.keyboardTypeInfo(from: files)
        }).disposed(by: disposeBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func keyboardTypeInfo(from index: Int) {
        if index == 1 {
            inputTx.keyboardType = .numberPad
        }else {
            inputTx.keyboardType = .default
        }
    }

}
