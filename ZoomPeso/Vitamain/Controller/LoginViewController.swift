//
//  LoginViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class LoginViewController: BaseViewController {
    
    var ksTime: String = ""
    var jsTime: String = ""
    
    var grand: Bool = true
    private var countdownTimer: Timer?
    private var remainingSeconds = 60
    
    lazy var loginView: LoginView = {
        let loginView = LoginView()
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        loginView.cycleBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            loginView.cycleBtn.isSelected.toggle()
            if loginView.cycleBtn.isSelected {
                grand = true
            }else {
                grand = false
            }
        }).disposed(by: disposeBag)
        
        loginView.privacyLabel.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            if let model = DataLoginManager.shared.currentModel {
                let pageUrl = model.pocket_private_url ?? ""
                let fiveVc = VitamainFiveViewController()
                fiveVc.pageUrl = pageUrl
                self.navigationController?.pushViewController(fiveVc, animated: true)
            }
        }).disposed(by: disposeBag)
        
        loginView.voiceBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            voiceInfo()
            ksTime = DeviceInfo.currentTimestamp
        }).disposed(by: disposeBag)
        
        loginView.loginBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            if grand {
                loginInfo()
            }else {
                ToastManagerConfig.showToastText(form: view, message: "Please review and accept the user agreement first.")
            }
        }).disposed(by: disposeBag)
        
        loginView.visibleLabel.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let phone = self.loginView.quakerTopTextField.text ?? ""
            if phone.isEmpty {
                ToastManagerConfig.showToastText(form: self.view, message: "Please Input Your Phone")
            }else {
                codeInfo()
            }
            ksTime = DeviceInfo.currentTimestamp
        }).disposed(by: disposeBag)
        
        if let model = DataLoginManager.shared.currentModel {
            let cordillera = model.cordillera ?? 0
            if cordillera == 1 {
                DispatchQueue.main.async {
                    let location = LocationManagerConfig()
                    location.getLocationInfo { [weak self] model in
                        self?.apiLoacationInfo(from: model)
                    }
                }
            }else {
                deviceApiInfo()
            }
        }
        
        self.loginView.quakerTopTextField
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                self.handleTextChange(from: text, count: 15, type: "phone")
            }).disposed(by: disposeBag)
        
        self.loginView.typicTextField
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                self.handleTextChange(from: text, count: 6, type: "code")
            }).disposed(by: disposeBag)
        
        self.loginView.backBlock = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
        
    }
    
    deinit {
        countdownTimer?.invalidate()
    }
    
}

extension LoginViewController {
    
    private func handleTextChange(from text: String, count: Int, type: String) {
        if text.count > count {
            if type == "phone" {
                self.loginView.quakerTopTextField.text = String(text.prefix(count))
            }else {
                self.loginView.typicTextField.text = String(text.prefix(count))
            }
        }
    }
    
    private func startCountdown() {
        loginView.visibleLabel.isUserInteractionEnabled = false
        remainingSeconds = 60
        countdownTimer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCountdown),
            userInfo: nil,
            repeats: true
        )
        
    }
    
    @objc private func updateCountdown() {
        remainingSeconds -= 1
        if remainingSeconds > 0 {
            loginView.visibleLabel.text = "\(remainingSeconds)s"
        } else {
            endCountdown()
        }
    }
    
    private func endCountdown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        loginView.visibleLabel.isUserInteractionEnabled = true
        let attributedString = NSMutableAttributedString(string: "Get code")
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: "Get code".count)
        )
        loginView.visibleLabel.attributedText = attributedString
    }
    
    private func codeInfo() {
        ViewCycleManager.showLoading()
        let hat = self.loginView.quakerTopTextField.text ?? ""
        let dict = ["hat": hat]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/similarly", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    self.startCountdown()
                    self.loginView.typicTextField.becomeFirstResponder()
                }
                let circular = success.circular ?? ""
                ToastManagerConfig.showToastText(form: self.view, message: circular)
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func voiceInfo() {
        let hat = self.loginView.quakerTopTextField.text ?? ""
        if hat.isEmpty {
            ToastManagerConfig.showToastText(form: self.view, message: "Please Input Your Phone")
            return
        }
        ViewCycleManager.showLoading()
        let dict = ["hat": hat]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/segment", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    self.loginView.typicTextField.becomeFirstResponder()
                }
                let circular = success.circular ?? ""
                ToastManagerConfig.showToastText(form: self.view, message: circular)
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func loginInfo() {
        let recollect = self.loginView.quakerTopTextField.text ?? ""
        let mine = self.loginView.typicTextField.text ?? ""
        if recollect.isEmpty {
            ToastManagerConfig.showToastText(form: self.view, message: "Please Input Your Phone")
            return
        }
        if mine.isEmpty {
            ToastManagerConfig.showToastText(form: self.view, message: "Please Input Your Code")
            return
        }
        ViewCycleManager.showLoading()
        let dict = ["recollect": recollect,
                    "mine": mine,
                    "page": "login"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/wedge", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    jsTime = DeviceInfo.currentTimestamp
                    let phone = success.net?.recollect ?? ""
                    let token = success.net?.attachment ?? ""
                    LoginConfig.saveLoginInfo(phone: phone, token: token)
                    ScroPortionPointConfig.pointToPageWithModel(with: "1", kstime: ksTime, jstime: jsTime)
                    DispatchQueue.main.async {
                        self.notiLastRootVcManager()
                    }
                }
                let circular = success.circular ?? ""
                ToastManagerConfig.showToastText(form: self.view, message: circular)
                break
            case .failure(_):
                break
            }
        }
    }
    
}
