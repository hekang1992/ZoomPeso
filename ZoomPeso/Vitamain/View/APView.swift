//
//  APView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/24.
//

import UIKit
import RxRelay

class APView: BaseView {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    lazy var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.image = UIImage(named: "aseuthigme")
        oneImageView.isUserInteractionEnabled = true
        return oneImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .white, textAlignment: .center)
        mlabel.text = "Information"
        return mlabel
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.setTitle("Save", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18.pix())
        nextBtn.backgroundColor = .init(hexStr: "#FF3824")
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.layer.cornerRadius = 23.5
        return nextBtn
    }()
    
    lazy var namelabel: UILabel = {
        let namelabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .left)
        namelabel.text = "Name"
        return namelabel
    }()
    
    lazy var nameTx: UITextField = {
        let nameTx = UITextField()
        nameTx.placeholder = "Name"
        nameTx.textColor = .black
        nameTx.backgroundColor = .init(hexStr: "#FFF5C3")
        nameTx.layer.cornerRadius = 10
        return nameTx
    }()
    
    lazy var idlabel: UILabel = {
        let idlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .left)
        idlabel.text = "Number"
        return idlabel
    }()
    
    lazy var idTx: UITextField = {
        let idTx = UITextField()
        idTx.placeholder = "Number"
        idTx.textColor = .black
        idTx.backgroundColor = .init(hexStr: "#FFF5C3")
        idTx.layer.cornerRadius = 10
        return idTx
    }()
    
    lazy var timelabel: UILabel = {
        let timelabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .left)
        timelabel.text = "Date"
        return timelabel
    }()
    
    lazy var timeBtn: UIButton = {
        let timeBtn = UIButton(type: .custom)
        timeBtn.backgroundColor = .init(hexStr: "#FFF5C3")
        timeBtn.layer.cornerRadius = 10
        timeBtn.setTitleColor(.black, for: .normal)
        timeBtn.contentHorizontalAlignment = .left
        return timeBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(oneImageView)
        oneImageView.addSubview(mlabel)
        oneImageView.addSubview(namelabel)
        oneImageView.addSubview(nameTx)
        oneImageView.addSubview(idlabel)
        oneImageView.addSubview(idTx)
        oneImageView.addSubview(timelabel)
        oneImageView.addSubview(timeBtn)
        addSubview(nextBtn)
        
        oneImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-30.pix())
            make.size.equalTo(CGSize(width: 358.pix(), height: 417.pix()))
        }
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
        }
        
        namelabel.snp.makeConstraints { make in
            make.top.equalTo(mlabel.snp.bottom).offset(28.pix())
            make.left.equalToSuperview().offset(15.pix())
            make.height.equalTo(21)
        }
        
        nameTx.snp.makeConstraints { make in
            make.left.equalTo(namelabel.snp.left)
            make.top.equalTo(namelabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
        }
        
        idlabel.snp.makeConstraints { make in
            make.top.equalTo(nameTx.snp.bottom).offset(18.pix())
            make.left.equalToSuperview().offset(15.pix())
            make.height.equalTo(21)
        }
        
        idTx.snp.makeConstraints { make in
            make.left.equalTo(idlabel.snp.left)
            make.top.equalTo(idlabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
        }
        
        timelabel.snp.makeConstraints { make in
            make.top.equalTo(idTx.snp.bottom).offset(18.pix())
            make.left.equalToSuperview().offset(15.pix())
            make.height.equalTo(21)
        }
        
        timeBtn.snp.makeConstraints { make in
            make.left.equalTo(timelabel.snp.left)
            make.top.equalTo(timelabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
        }
        
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.top.equalTo(oneImageView.snp.bottom).offset(10.pix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            nameTx.text = model.paralysed ?? ""
            idTx.text = model.sting ?? ""
            
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd"

            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd/MM/yyyy"
            
            let time = model.stuff ?? ""
            
            if let date = inputFormatter.date(from: time) {
                timeBtn.setTitle(outputFormatter.string(from: date), for: .normal)
            }
            
        }).disposed(by: disposeBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
