//
//  MyLoveViewCell.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/25.
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
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return contentLabel
    }()
    
    lazy var contaceView: UIView = {
        let contaceView = UIView()
        contaceView.backgroundColor = .init(hexStr: "#FFF5C3")
        contaceView.layer.cornerRadius = 10.pix()
        contaceView.layer.masksToBounds = true
        return contaceView
    }()
    
    lazy var rightImageView: UIImageView = {
        let rightImageView = UIImageView()
        rightImageView.image = UIImage(named: "rightimagebal")
        return rightImageView
    }()
    
    lazy var clickLabel: UILabel = {
        let clickLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15.pix(), weight: .medium), textColor: .init(hexStr: "#E2D38B")!, textAlignment: .left)
        return clickLabel
    }()
    
    lazy var phoenLabel: UILabel = {
        let phoenLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .black, textAlignment: .left)
        return phoenLabel
    }()
    
    lazy var phoenView: UIView = {
        let phoenView = UIView()
        phoenView.backgroundColor = .init(hexStr: "#FFF5C3")
        phoenView.layer.cornerRadius = 10.pix()
        phoenView.layer.masksToBounds = true
        return phoenView
    }()
    
    lazy var phoneImageView: UIImageView = {
        let phoneImageView = UIImageView()
        phoneImageView.image = UIImage(named: "phoneiconigme")
        return phoneImageView
    }()
    
    lazy var cpLabel: UILabel = {
        let cpLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15.pix(), weight: .medium), textColor: .init(hexStr: "#E2D38B")!, textAlignment: .left)
        return cpLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(bgView)
        bgView.addSubview(desclabel)
        bgView.addSubview(contentLabel)
        bgView.addSubview(contaceView)
        contaceView.addSubview(clickLabel)
        contaceView.addSubview(rightImageView)
        bgView.addSubview(phoenLabel)
        bgView.addSubview(phoenView)
        phoenView.addSubview(phoneImageView)
        phoenView.addSubview(cpLabel)
        
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
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(desclabel.snp.bottom).offset(10.pix())
            make.left.equalToSuperview().offset(13.pix())
            make.height.equalTo(21.pix())
        }
        contaceView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentLabel.snp.bottom).offset(5.pix())
            make.left.equalTo(contentLabel.snp.left)
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
        
        phoenLabel.snp.makeConstraints { make in
            make.top.equalTo(contaceView.snp.bottom).offset(10.pix())
            make.left.equalToSuperview().offset(13.pix())
            make.height.equalTo(21.pix())
        }
        phoenView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(phoenLabel.snp.bottom).offset(5.pix())
            make.left.equalTo(phoenLabel.snp.left)
            make.height.equalTo(44.pix())
        }
        phoneImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-5.pix())
            make.size.equalTo(CGSize(width: 14, height: 14))
        }
        cpLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15.pix())
            make.right.equalTo(phoneImageView.snp.left).offset(-2.pix())
            make.height.equalTo(44.pix())
        }
        
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let backs = NSMutableAttributedString(string: model.backs ?? "")
            let range = NSRange(location: 0, length: backs.length)
            backs.addAttributes([.font: UIFont(name: ArialBlackFont, size: 15)!], range: range)
            desclabel.attributedText = backs
            contentLabel.text = model.labours ?? ""
            let common = model.common ?? ""
            let paths = model.paths ?? ""
            if common.isEmpty {
                if paths.isEmpty {
                    clickLabel.text = model.astonished ?? ""
                    clickLabel.textColor = .init(hexStr: "#E2D38B")
                }else {
                    let extricate = model.extricate ?? []
                    for model in extricate {
                        let bajada = model.bajada ?? ""
                        if paths == bajada {
                            clickLabel.text = model.paralysed ?? ""
                            clickLabel.textColor = .init(hexStr: "#FF3824")
                        }
                    }
                }
            }else {
                clickLabel.text = common
                clickLabel.textColor = .init(hexStr: "#FF3824")
            }
            
            let phone = model.beaten ?? ""
            let name = model.paralysed ?? ""
            phoenLabel.text = model.excepted ?? ""
            if phone.isEmpty {
                cpLabel.text = model.bees ?? ""
                cpLabel.textColor = .init(hexStr: "#E2D38B")
            }else {
                cpLabel.text = "\(name) - \(phone)"
                cpLabel.textColor = .init(hexStr: "#FF3824")
            }
            
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

