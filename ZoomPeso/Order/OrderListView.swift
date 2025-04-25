//
//  OrderListView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay

class OrderListView: BaseView {
    
    var modelArray = BehaviorRelay<[rubyModel]?>(value: nil)
    
    let height = 73.pix()
    let width = SCREEN_WIDTH * 0.25
    
    var oneBlock: (() -> Void)?
    var twoBlock: (() -> Void)?
    var threeBlock: (() -> Void)?
    var fourBlock: (() -> Void)?
    
    private var gradientLayer: CAGradientLayer!
    
    var block: ((rubyModel) -> Void)?
    
    lazy var bgView: UIView = {
        let bgView = UIView()
        return bgView
    }()
    
    lazy var headImageView: UIImageView = {
        let headImageView = UIImageView()
        headImageView.image = UIImage(named: "orderlisgimge")
        return headImageView
    }()
    
    lazy var mahuaImageView: UIImageView = {
        let mahuaImageView = UIImageView()
        mahuaImageView.image = UIImage(named: "mahuaimage")
        return mahuaImageView
    }()
    
    lazy var oneBtn: UIButton = {
        let oneBtn = UIButton(type: .custom)
        oneBtn.adjustsImageWhenHighlighted = false
        oneBtn.setImage(UIImage(named: "allnor"), for: .normal)
        oneBtn.setImage(UIImage(named: "allsel"), for: .selected)
        oneBtn.isSelected = true
        return oneBtn
    }()
    
    lazy var twoBtn: UIButton = {
        let twoBtn = UIButton(type: .custom)
        twoBtn.adjustsImageWhenHighlighted = false
        twoBtn.setImage(UIImage(named: "applynor"), for: .normal)
        twoBtn.setImage(UIImage(named: "applysel"), for: .selected)
        return twoBtn
    }()
    
    lazy var threeBtn: UIButton = {
        let threeBtn = UIButton(type: .custom)
        threeBtn.adjustsImageWhenHighlighted = false
        threeBtn.setImage(UIImage(named: "repaynor"), for: .normal)
        threeBtn.setImage(UIImage(named: "repaysel"), for: .selected)
        return threeBtn
    }()
    
    lazy var fourBtn: UIButton = {
        let fourBtn = UIButton(type: .custom)
        fourBtn.adjustsImageWhenHighlighted = false
        fourBtn.setImage(UIImage(named: "finishnor"), for: .normal)
        fourBtn.setImage(UIImage(named: "finishsel"), for: .selected)
        return fourBtn
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(OrderListViewCell.self, forCellReuseIdentifier: "OrderListViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        addSubview(headImageView)
        addSubview(mahuaImageView)
        addSubview(oneBtn)
        addSubview(twoBtn)
        addSubview(threeBtn)
        addSubview(fourBtn)
        addSubview(tableView)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        headImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(231.pix())
        }
        mahuaImageView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(headImageView.snp.bottom).offset(-20)
        }
        oneBtn.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(mahuaImageView.snp.bottom).offset(-10)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        twoBtn.snp.makeConstraints { make in
            make.left.equalTo(oneBtn.snp.right)
            make.top.equalTo(oneBtn.snp.top)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        threeBtn.snp.makeConstraints { make in
            make.left.equalTo(twoBtn.snp.right)
            make.top.equalTo(oneBtn.snp.top)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        fourBtn.snp.makeConstraints { make in
            make.left.equalTo(threeBtn.snp.right)
            make.top.equalTo(oneBtn.snp.top)
            make.size.equalTo(CGSize(width: width, height: height))
        }
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(oneBtn.snp.bottom)
        }
        setupGradient()
        
        oneBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.oneBlock?()
            selectButton(oneBtn)
        }).disposed(by: disposeBag)
        
        twoBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.twoBlock?()
            selectButton(twoBtn)
        }).disposed(by: disposeBag)
        
        threeBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.threeBlock?()
            selectButton(threeBtn)
        }).disposed(by: disposeBag)
        
        fourBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            self.fourBlock?()
            selectButton(fourBtn)
        }).disposed(by: disposeBag)
        
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bgView.bounds
    }
    
    private func selectButton(_ selectedButton: UIButton) {
        oneBtn.isSelected = false
        twoBtn.isSelected = false
        threeBtn.isSelected = false
        fourBtn.isSelected = false
        selectedButton.isSelected = true
    }
    
    private func setupGradient() {
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hexStr: "#FFF1CB")!.cgColor,
            UIColor(hexStr: "#FFDEA4")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        bgView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

extension OrderListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 188.pix()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelArray.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListViewCell", for: indexPath) as! OrderListViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        let model = self.modelArray.value?[indexPath.row]
        cell.model.accept(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = self.modelArray.value?[indexPath.row] {
            self.block?(model)
        }
    }
    
}
