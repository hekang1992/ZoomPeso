//
//  CenterView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/23.
//

import UIKit
import RxRelay

class CenterView: BaseView {
    
    var modelBlock: ((rubyModel) -> Void)?
    
    var modelArry = BehaviorRelay<[rubyModel]?>(value: nil)
    
    let picWidth = SCREEN_WIDTH * 0.25
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .init(hexStr: "#FD744D")
        return bgView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .black, textAlignment: .center)
        nameLabel.text = "Me"
        return nameLabel
    }()
    
    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "centeriamge")
        return logoImageView
    }()
    
    lazy var oneBtn: UIButton = {
        let oneBtn = UIButton(type: .custom)
        oneBtn.setImage(UIImage(named: "alloreiamgece"), for: .normal)
        return oneBtn
    }()
    
    lazy var twoBtn: UIButton = {
        let twoBtn = UIButton(type: .custom)
        twoBtn.setImage(UIImage(named: "centeimagepa"), for: .normal)
        return twoBtn
    }()
    
    lazy var threeBtn: UIButton = {
        let threeBtn = UIButton(type: .custom)
        threeBtn.setImage(UIImage(named: "repcenteplay"), for: .normal)
        return threeBtn
    }()
    
    lazy var fourBtn: UIButton = {
        let fourBtn = UIButton(type: .custom)
        fourBtn.setImage(UIImage(named: "centefinshimge"), for: .normal)
        return fourBtn
    }()
    
    lazy var phonelabel: UILabel = {
        let phonelabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .white, textAlignment: .center)
        let phone = UserDefaults.standard.object(forKey: USER_PHONE) as? String ?? ""
        phonelabel.text = maskPhoneNumber(phone)
        return phonelabel
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(CenterListViewCell.self, forCellReuseIdentifier: "CenterListViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoImageView)
        logoImageView.addSubview(phonelabel)
        logoImageView.addSubview(nameLabel)
        addSubview(bgView)
        addSubview(tableView)
        bgView.addSubview(oneBtn)
        bgView.addSubview(twoBtn)
        bgView.addSubview(threeBtn)
        bgView.addSubview(fourBtn)
        
        logoImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.height.equalTo(235.pix())
        }
        phonelabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12.pix())
            make.width.equalTo(200.pix())
            make.height.equalTo(56.pix())
            make.top.equalToSuperview().offset(110.pix())
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(5)
        }
        bgView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(-30)
            make.left.bottom.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
        }
        oneBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15.pix())
            make.width.equalTo(79.pix())
            make.height.equalTo(92.pix())
        }
        
        twoBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(oneBtn.snp.right).offset(10.pix())
            make.width.equalTo(79.pix())
            make.height.equalTo(92.pix())
        }
        
        threeBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(twoBtn.snp.right).offset(10.pix())
            make.width.equalTo(79.pix())
            make.height.equalTo(92.pix())
        }
        
        fourBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(threeBtn.snp.right).offset(10.pix())
            make.width.equalTo(79.pix())
            make.height.equalTo(92.pix())
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(oneBtn.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.bottom.equalToSuperview().offset(-90)
        }
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)

        modelArry.compactMap { $0 }.asObservable().bind(to: tableView.rx.items(cellIdentifier: "CenterListViewCell", cellType: CenterListViewCell.self)) { row, model, cell in
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            let walckanaer = model.walckanaer ?? ""
            cell.listImageView.kf.setImage(with: URL(string: walckanaer), placeholder: UIImage(named: "onelaige"))
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(rubyModel.self).subscribe(onNext: { [weak self] model in
            guard let self = self else { return }
            self.modelBlock?(model)
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.layer.cornerRadius = 30
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bgView.layer.masksToBounds = true
    }
    
    func maskPhoneNumber(_ phone: String) -> String {
        guard phone.count >= 10 else { return phone }
        let start = phone.prefix(3)
        let end = phone.suffix(4)
        return "\(start)****\(end)"
    }
    
}

extension CenterView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 101.pix()
    }
}
