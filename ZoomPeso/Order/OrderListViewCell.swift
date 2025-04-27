//
//  OrderListViewCell.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay

class OrderListViewCell: BaseViewCell {
    
    var model = BehaviorRelay<rubyModel?>(value: nil)

    lazy var cellImageView: UIImageView = {
        let cellImageView = UIImageView()
        cellImageView.image = UIImage(named: "celliamge")
        cellImageView.isUserInteractionEnabled = true
        return cellImageView
    }()
    
    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.layer.cornerRadius = 5
        logoImageView.layer.masksToBounds = true
        return logoImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 13.pix(), weight: .semibold), textColor: .white, textAlignment: .left)
        return nameLabel
    }()
    
    lazy var typeLabel: UILabel = {
        let typeLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 13.pix(), weight: .bold), textColor: .init(hexStr: "#FF2727")!, textAlignment: .right)
        return typeLabel
    }()
    
    lazy var moneyLabel: UILabel = {
        let moneyLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 42.pix())!, textColor: .init(hexStr: "#712202")!, textAlignment: .center)
        return moneyLabel
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.init(hexStr: "#FFE4B6")
        bgView.layer.cornerRadius = 5
        return bgView
    }()
    
    lazy var checkLabel: UILabel = {
        let checkLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .bold), textColor: .white, textAlignment: .center)
        checkLabel.layer.cornerRadius = 5
        checkLabel.layer.masksToBounds = true
        checkLabel.text = "Check"
        checkLabel.backgroundColor = .init(hexStr: "#FF3824")
        return checkLabel
    }()
    
    lazy var dlLabel: UILabel = {
        let dlLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 11.pix(), weight: .medium), textColor: .init(hexStr: "#BF9B0E")!, textAlignment: .left)
        return dlLabel
    }()
    
    lazy var dtLabel: UILabel = {
        let dtLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 11.pix(), weight: .medium), textColor: .init(hexStr: "#BF9B0E")!, textAlignment: .left)
        return dtLabel
    }()
    
    lazy var dlMustLabel: UILabel = {
        let dlMustLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(hexStr: "#712202")!, textAlignment: .right)
        return dlMustLabel
    }()
    
    lazy var dtMustLabel: UILabel = {
        let dtMustLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 14.pix(), weight: .semibold), textColor: .init(hexStr: "#712202")!, textAlignment: .right)
        return dtMustLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cellImageView)
        cellImageView.addSubview(logoImageView)
        cellImageView.addSubview(nameLabel)
        cellImageView.addSubview(typeLabel)
        cellImageView.addSubview(moneyLabel)
        cellImageView.addSubview(bgView)
        cellImageView.addSubview(checkLabel)
        bgView.addSubview(dlLabel)
        bgView.addSubview(dtLabel)
        bgView.addSubview(dlMustLabel)
        bgView.addSubview(dtMustLabel)
        cellImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 372.pix(), height: 183.pix()))
        }
        logoImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(47.pix())
            make.top.equalToSuperview().offset(10.pix())
            make.size.equalTo(CGSize(width: 25.pix(), height: 25.pix()))
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.left.equalTo(logoImageView.snp.right).offset(6.pix())
            make.height.equalTo(25.pix())
        }
        typeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20.pix())
            make.right.equalToSuperview().offset(-25.pix())
            make.height.equalTo(16.pix())
        }
        moneyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(typeLabel.snp.bottom).offset(2)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: 60.pix()))
        }
        bgView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(23.pix())
            make.bottom.equalToSuperview().offset(-22.pix())
            make.height.equalTo(58.pix())
            make.width.equalTo(255.pix())
        }
        checkLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bgView.snp.centerY)
            make.size.equalTo(CGSize(width: 65.pix(), height: 59.pix()))
            make.right.equalToSuperview().offset(-25.pix())
        }
        dlLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(9.pix())
            make.left.equalToSuperview().offset(11.pix())
            make.height.equalTo(15.pix())
        }
        dtLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8.pix())
            make.left.equalToSuperview().offset(11.pix())
            make.height.equalTo(15.pix())
        }
        dlMustLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6.pix())
            make.right.equalToSuperview().offset(-9.pix())
            make.height.equalTo(20.pix())
        }
        dtMustLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-6.pix())
            make.right.equalToSuperview().offset(-9.pix())
            make.height.equalTo(20.pix())
        }
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self, let model = model else { return }
            let logUrl = model.antagonist ?? ""
            logoImageView.kf.setImage(with: URL(string: logUrl))
            nameLabel.text = model.pitying ?? ""
            typeLabel.text = model.thrusts ?? ""
            moneyLabel.text = model.carrion ?? ""
            dlLabel.text = model.rapacious ?? ""
            dtLabel.text = model.dont ?? ""
            dlMustLabel.text = model.casts ?? ""
            dtMustLabel.text = model.harpalid ?? ""
        }).disposed(by: disposeBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
