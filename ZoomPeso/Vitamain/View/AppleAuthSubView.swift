//
//  AppleAuthSubView.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/24.
//

import UIKit
import RxRelay

class AppleAuthSubView: BaseView {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var block: (() -> Void)?
    
    var timeBlock: (() -> Void)?
    
    lazy var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.image = UIImage(named: "aseuthigmeasge")
        oneImageView.isUserInteractionEnabled = true
        return oneImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .black, textAlignment: .center)
        mlabel.text = "Please confirm"
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
    
    lazy var namelabel: UILabel = {
        let namelabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .center)
        namelabel.text = "Full Name"
        return namelabel
    }()
    
    lazy var nameTx: UITextField = {
        let nameTx = UITextField()
        nameTx.placeholder = "Name"
        nameTx.textColor = .black
        nameTx.backgroundColor = .white
        nameTx.layer.cornerRadius = 10.pix()
        nameTx.textAlignment = .center
        return nameTx
    }()
    
    lazy var idlabel: UILabel = {
        let idlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .center)
        idlabel.text = "Number"
        return idlabel
    }()
    
    lazy var idTx: UITextField = {
        let idTx = UITextField()
        idTx.placeholder = "ID No."
        idTx.textColor = .black
        idTx.backgroundColor = .white
        idTx.layer.cornerRadius = 10.pix()
        idTx.textAlignment = .center
        return idTx
    }()
    
    lazy var timelabel: UILabel = {
        let timelabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .center)
        timelabel.text = "Date Birth"
        return timelabel
    }()
    
    lazy var timeBtn: UIButton = {
        let timeBtn = UIButton(type: .custom)
        timeBtn.backgroundColor = .white
        timeBtn.layer.cornerRadius = 10.pix()
        timeBtn.setTitleColor(.black, for: .normal)
        timeBtn.contentHorizontalAlignment = .center
        return timeBtn
    }()
    
    lazy var desclabel: UILabel = {
        let desclabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 12.pix(), weight: .semibold), textColor: UIColor.init(hexStr: "#FEA124")!, textAlignment: .center)
        desclabel.numberOfLines = 0
        desclabel.text = "Please carefully check the information, it cannot be changed after uploading."
        return desclabel
    }()
    
    lazy var cancelBtn: UIButton = {
        let cancelBtn = UIButton(type: .custom)
        cancelBtn.setImage(UIImage(named: "cencelximge"), for: .normal)
        return cancelBtn
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
        oneImageView.addSubview(desclabel)
        addSubview(nextBtn)
        addSubview(cancelBtn)
        
        oneImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50.pix())
            make.size.equalTo(CGSize(width: 288.pix(), height: 461.pix()))
        }
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
            make.left.equalToSuperview()
        }
        
        namelabel.snp.makeConstraints { make in
            make.top.equalTo(mlabel.snp.bottom).offset(28.pix())
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        
        nameTx.snp.makeConstraints { make in
            make.top.equalTo(namelabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 210.pix(), height: 40.pix()))
        }
        
        idlabel.snp.makeConstraints { make in
            make.top.equalTo(nameTx.snp.bottom).offset(12.pix())
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        
        idTx.snp.makeConstraints { make in
            make.top.equalTo(idlabel.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 210.pix(), height: 40.pix()))
        }
        
        timelabel.snp.makeConstraints { make in
            make.top.equalTo(idTx.snp.bottom).offset(12.pix())
            make.left.equalToSuperview().offset(15.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(21)
        }
        
        timeBtn.snp.makeConstraints { make in
            make.top.equalTo(timelabel.snp.bottom).offset(10.pix())
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 210.pix(), height: 40.pix()))
        }
        
        desclabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(timeBtn.snp.bottom).offset(55.pix())
            make.left.equalToSuperview().offset(16.5)
        }
        
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.top.equalTo(oneImageView.snp.bottom).offset(-30.pix())
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nextBtn.snp.bottom).offset(55.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        
        cancelBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.block?()
        }).disposed(by: disposeBag)
        
        timeBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.timeBlock?()
        }).disposed(by: disposeBag)
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            nameTx.text = model.paralysed ?? ""
            idTx.text = model.sting ?? ""
            
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd"

            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy/MM/dd"
            
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
