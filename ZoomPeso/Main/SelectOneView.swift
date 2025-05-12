//
//  SelectOneView.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/25.
//

import UIKit
import RxRelay

class SelectOneView: BaseView {
    
    var dismissBlock: (() -> Void)?
    var comfirmBlock: ((Int, extricateModel) -> Void)?
    
    var selectIndexPath: IndexPath?
    
    var modelArray = BehaviorRelay<[extricateModel]?>(value: nil)

    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "oneenumimage")
        bgImageView.isUserInteractionEnabled = true
        return bgImageView
    }()
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        return bgView
    }()
    
    lazy var saveBtn: UIButton = {
        let saveBtn = UIButton(type: .custom)
        saveBtn.setTitle("Confirm", for: .normal)
        saveBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18.pix())
        saveBtn.backgroundColor = .init(hexStr: "#FF3824")
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.layer.cornerRadius = 23.5
        saveBtn.layer.borderWidth = 2
        saveBtn.layer.borderColor = UIColor.init(hexStr: "#FCE69B")?.cgColor
        return saveBtn
    }()
    
    lazy var cancelBtn: UIButton = {
        let cancelBtn = UIButton(type: .custom)
        cancelBtn.setImage(UIImage(named: "cencelximge"), for: .normal)
        return cancelBtn
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(AuthViewCell.self, forCellReuseIdentifier: "AuthViewCell")
        tableView.estimatedRowHeight = 80
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = UITableView.automaticDimension
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView)
        bgImageView.addSubview(bgView)
        bgView.addSubview(tableView)
        addSubview(saveBtn)
        addSubview(cancelBtn)
        
        bgImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 288.pix(), height: 299.pix()))
            make.centerY.equalToSuperview().offset(-40.pix())
        }
        
        bgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(87.pix())
            make.left.equalToSuperview().offset(3.pix())
            make.centerX.equalToSuperview()
            make.height.equalTo(180.pix())
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        saveBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bgImageView.snp.bottom).offset(-23.pix())
            make.size.equalTo(CGSize(width: 237.pix(), height: 46.pix()))
        }
        
        cancelBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(saveBtn.snp.bottom).offset(50.pix())
            make.size.equalTo(CGSize(width: 26.pix(), height: 26.pix()))
        }
        
        saveBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let selectIndexPath = selectIndexPath else { return }
            if let model = self.modelArray.value?[selectIndexPath.row] {
                self.comfirmBlock?(selectIndexPath.row, model)
            }
            
        }).disposed(by: disposeBag)
        
        cancelBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.dismissBlock?()
        }).disposed(by: disposeBag)
        
        modelArray.compactMap { $0 }.asObservable().bind(to: tableView.rx.items(cellIdentifier: "AuthViewCell", cellType: AuthViewCell.self)) { row, model, cell in
            cell.nameLabel.text = model.paralysed ?? ""
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.cImageView.isHidden = true
            cell.nameLabel.textAlignment = .center
            if let selectIndexPath = self.selectIndexPath {
                if selectIndexPath.row == row {
                    cell.bgView.backgroundColor = .init(hexStr: "#FF992F")
                }else {
                    cell.bgView.backgroundColor = .init(hexStr: "#FFF5C3")
                }
            }
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            selectIndexPath = indexPath
            tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
