//
//  ParaMeraView.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/5/3.
//

import UIKit
import RxRelay

class ParaMeraView: BaseView {
    
    var cellBlock: ((juicesModel) -> Void)?
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ParaMeraCell.self, forCellReuseIdentifier: "ParaMeraCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    lazy var ctImageView: UIImageView = {
        let ctImageView = UIImageView()
        ctImageView.image = UIImage(named: "loiamgepic")
        return ctImageView
    }()
    
    lazy var namelabel: UILabel = {
        let namelabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), textColor: .black, textAlignment: .left)
        namelabel.text = "ZoomPeso"
        return namelabel
    }()
    
    var headBlock: ((juicesModel) -> Void)?
    
    var juices: juicesModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        addSubview(ctImageView)
        addSubview(namelabel)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        ctImageView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(2.pix())
            make.left.equalToSuperview().offset(15.pix())
            make.size.equalTo(CGSize(width: 28.pix(), height: 28.pix()))
        }
        namelabel.snp.makeConstraints { make in
            make.centerY.equalTo(ctImageView.snp.centerY)
            make.left.equalTo(ctImageView.snp.right).offset(5.pix())
            make.height.equalTo(22.pix())
        }
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ParaMeraView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 254.pix()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        let mainImageView = UIImageView()
        mainImageView.image = UIImage(named: "pereimge")
        mainImageView.isUserInteractionEnabled = true
       
        let fotImageView = UIImageView()
        fotImageView.image = UIImage(named: "pereiamgelitt")
      
        let headBtn = UIButton(type: .custom)
        headBtn.setBackgroundImage(UIImage(named: "loiagebtn"), for: .normal)
        headBtn.setTitle("Go Loan >", for: .normal)
        headBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 19.pix())
        
        let leftlabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .init(hexStr: "#F9732C")!, textAlignment: .center)
      
        let rightlabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .semibold), textColor: .init(hexStr: "#F9732C")!, textAlignment: .center)
        
        let mtlabel = UILabel.createLabel(font: UIFont.init(name: ArialBlackFont, size: 58)!, textColor: .init(hexStr: "#F5B837")!, textAlignment: .center)
        
        headView.addSubview(mainImageView)
        mainImageView.addSubview(fotImageView)
        mainImageView.addSubview(headBtn)
        mainImageView.addSubview(leftlabel)
        mainImageView.addSubview(rightlabel)
        mainImageView.addSubview(mtlabel)
        mainImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        fotImageView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(146.pix())
        }
        headBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(94.pix())
            make.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: 156.pix(), height: 51.pix()))
        }
        leftlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56.pix())
            make.right.equalToSuperview().offset(-10.pix())
            make.height.equalTo(53.pix())
            make.width.equalTo(80.pix())
        }
        rightlabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(56.pix())
            make.right.equalTo(leftlabel.snp.left).offset(-12.pix())
            make.height.equalTo(53.pix())
            make.width.equalTo(128.pix())
        }
        mtlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(55.pix())
            make.bottom.equalTo(headBtn.snp.top).offset(-5.pix())
        }
        model.asObservable().subscribe(onNext: { [weak self] model in
            guard let self = self else { return }
            let ruby = model?.ruby ?? []
            for model in ruby {
                let bajada = model.bajada ?? ""
                if bajada == "South" {
                    self.juices = model.juices?.first
                    leftlabel.text = model.juices?.first?.cutting ?? ""
                    rightlabel.text = model.juices?.first?.entangle ?? ""
                    mtlabel.text = model.juices?.first?.vain ?? ""
                    let tyi = model.juices?.first?.thrusts ?? ""
                    headBtn.setTitle("\(tyi) >", for: .normal)
                }
            }
        }).disposed(by: disposeBag)
        
        headBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self, let model = self.juices else { return }
            self.headBlock?(model)
        }).disposed(by: disposeBag)
        
        return headView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ruby = self.model.value?.ruby ?? []
        for model in ruby {
            let bajada = model.bajada ?? ""
            if bajada == "compared" {
                return model.juices?.count ?? 0
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.pix()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ParaMeraCell", for: indexPath) as! ParaMeraCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let ruby = self.model.value?.ruby ?? []
        for model in ruby {
            let bajada = model.bajada ?? ""
            if bajada == "compared" {
                let modelArray = model.juices ?? []
                cell.model.accept(modelArray[indexPath.row])
            }
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ruby = self.model.value?.ruby ?? []
        for model in ruby {
            let bajada = model.bajada ?? ""
            if bajada == "compared" {
                let modelArray = model.juices ?? []
                self.cellBlock?(modelArray[indexPath.row])
            }
        }
    }
    
}
