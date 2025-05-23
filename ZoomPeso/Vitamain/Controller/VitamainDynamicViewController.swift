//
//  VitamainDynamicViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/22.
//

import UIKit
import RxRelay
import AVFoundation
import Photos
import TYAlertController
import Kingfisher
import Combine

class VitamainDynamicViewController: BaseViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var cancellables = Set<AnyCancellable>()
        
    var oneModel = BehaviorRelay<netModel?>(value: nil)
    
    var kstime: String = ""
    
    lazy var hedImageView: UIImageView = {
        let hedImageView = UIImageView()
        hedImageView.image = UIImage(named: "seigmeiage")
        return hedImageView
    }()
    
    lazy var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.image = UIImage(named: "aseuthigme")
        return oneImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .white, textAlignment: .center)
        mlabel.text = "Step 1"
        return mlabel
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18.pix())
        nextBtn.backgroundColor = .init(hexStr: "#FF3824")
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.layer.cornerRadius = 23.5
        return nextBtn
    }()
    
    lazy var infoView: UIView = {
        let infoView = UIView()
        infoView.backgroundColor = .init(hexStr: "#FFFAED")
        return infoView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ClickViewCell.self, forCellReuseIdentifier: "ClickViewCell")
        tableView.register(InputViewCell.self, forCellReuseIdentifier: "InputViewCell")
        tableView.estimatedRowHeight = 100
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        kstime = DeviceInfo.currentTimestamp
        view.addSubview(hedImageView)
        hedImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        
        self.headView.nameLabel.text = "Job information"
        addHeadView()
        self.headView.backBlock = { [weak self] in
            self?.popToVitamainGuideOrRoot()
        }
        
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(hedImageView.snp.bottom).offset(-20)
        }
        view.addSubview(oneImageView)
        oneImageView.addSubview(mlabel)
        oneImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 358.pix(), height: 448.pix()))
        }
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
        }
        
        view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.bottom.equalToSuperview().offset(-30.pix())
        }
        
        view.addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.top.equalTo(oneImageView.snp.top).offset(82.pix())
            make.left.equalTo(oneImageView.snp.left).offset(6.5.pix())
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextBtn.snp.top).offset(-15.pix())
        }
        
        infoView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self,
                  let model = self.model.value,
                  let oneModel = self.oneModel.value,
                  let modelArray = oneModel.intercept else { return }
            let dict = modelArray.reduce(into: ["barricaded": model.enlarged?.orifice ?? ""]) { result, model in
                guard let key = model.wedge else { return }
                let reascended = model.reascended ?? ""
                if reascended == "Some" || reascended == "feeble" {
                    result[key] = model.hound ?? ""
                }else {
                    result[key] = model.bajada ?? ""
                }
            }
            safeBingoInfo(with: dict)
        }).disposed(by: disposeBag)
        
        getApiInfo()
    }
    
}

extension VitamainDynamicViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoView.layer.cornerRadius = 15
        infoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        infoView.layer.masksToBounds = true
    }
    
    private func getApiInfo() {
        ViewCycleManager.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded,
                    "bear": "1",
                    "cotton": "0"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/standing", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    if let model = success.net {
                        self.oneModel.accept(model)
                        self.tableView.reloadData()
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func safeBingoInfo(with dict: [String: String]) {
        ViewCycleManager.showLoading()
        let barricaded = dict["barricaded"] ?? ""
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/uvre", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    productDetailInfo(from: barricaded) { model in
                        self.model.accept(model)
                        self.vitaminInfo(from: model) { model in
                            
                        }
                    }
                    ScroPortionPointConfig.pointToPageWithModel(with: "6", kstime: kstime, jstime: DeviceInfo.currentTimestamp)
                }else {
                    ToastManagerConfig.showToastText(form: view, message: success.circular ?? "")
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}

extension VitamainDynamicViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.oneModel.value
        return model?.intercept?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.oneModel.value?.intercept?[indexPath.row]
        let reascended = model?.reascended ?? ""
        if reascended == "inflicted" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClickViewCell", for: indexPath) as! ClickViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.model.accept(model)
            cell.clickBlock = { [weak self] label in
                guard let self = self, let model = model else { return }
                popselectEnumViewInfo(from: model, label: label)
            }
            return cell
        }else if reascended == "feeble" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClickViewCell", for: indexPath) as! ClickViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.model.accept(model)
            cell.clickBlock = { [weak self] label in
                guard let self = self, let model = model else { return }
                popSelectThreeViewInfo(tin: model, label: label)
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputViewCell", for: indexPath) as! InputViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.model.accept(model)
            cell.inputTx.publisher(for: \.text)
                .compactMap { $0 }
                .filter { !$0.isEmpty }
                .sink { text in
                    model?.hound = text
                }
                .store(in: &cancellables)
            return cell
        }
    }
    
}

extension VitamainDynamicViewController {
    
    private func popselectEnumViewInfo(from model: interceptModel, label: UILabel) {
        let selectEnumView = SelectAuthEnmuView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        selectEnumView.modelArray.accept(model.extricate ?? [])
        let alertVc = TYAlertController(alert: selectEnumView, preferredStyle: .alert)!
        self.present(alertVc, animated: true)
        
        selectEnumView.dismissBlock = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
        
        selectEnumView.comfirmBlock = { [weak self] index, enumModel in
            guard let self = self else { return }
            self.dismiss(animated: true) {
                label.text = enumModel.paralysed ?? ""
                label.textColor = .init(hexStr: "#FF3824")
                model.bajada = enumModel.bajada ?? ""
                model.hound = enumModel.paralysed ?? ""
                model.common = enumModel.paralysed ?? ""
            }
        }
        
    }
    
    private func popSelectThreeViewInfo(tin model: interceptModel, label: UILabel) {
        if let modelArray = DataAddressManager.shared.currentModel?.ruby {
            let listArray = ThrottleModelConig.processThroData(dataSource: modelArray)
            let pickerView = SelectThreeConfig.showAddressPicker(from: listArray, pickerMode: .area) { address, code in
                label.text = address
                label.textColor = .init(hexStr: "#FF3824")
                model.hound = address
                model.common = code
            }
            pickerView.show()
        }
        
    }
    
}
