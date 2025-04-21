//
//  LoginViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class LoginViewController: BaseViewController {
    
    var grand: Bool = false
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
        
        loginView.phonelabel.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            
        }).disposed(by: disposeBag)
        
        loginView.voiceBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            voiceInfo()
        }).disposed(by: disposeBag)
        
        loginView.loginBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            if grand {
                loginInfo()
            }else {
                ToastShowConfig.showMessage(form: view, message: "Please review and accept the user agreement first.")
            }
        }).disposed(by: disposeBag)
        
        loginView.sendCodeLabel.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let phone = self.loginView.phoneTx.text ?? ""
            if phone.isEmpty {
                ToastShowConfig.showMessage(form: self.view, message: "Please Input Your Phone")
            }else {
                codeInfo()
            }
        }).disposed(by: disposeBag)
        
        DispatchQueue.main.async {
            let location = LocationConfig()
            location.getLocationInfo { [weak self] model in
                self?.apiLoacationInfo(from: model)
            }
        }
        
        self.loginView.phoneTx
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                self.handleTextChange(from: text, count: 15, type: "phone")
            }).disposed(by: disposeBag)
        
        self.loginView.codeTx
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                self.handleTextChange(from: text, count: 6, type: "code")
            }).disposed(by: disposeBag)
        
    }
    
    deinit {
        countdownTimer?.invalidate()
    }
    
}

extension LoginViewController {
    
    private func handleTextChange(from text: String, count: Int, type: String) {
        if text.count > count {
            if type == "phone" {
                self.loginView.phoneTx.text = String(text.prefix(count))
            }else {
                self.loginView.codeTx.text = String(text.prefix(count))
            }
        }
    }
    
    private func startCountdown() {
        loginView.sendCodeLabel.isUserInteractionEnabled = false
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
            loginView.sendCodeLabel.text = "\(remainingSeconds)s"
        } else {
            endCountdown()
        }
    }
    
    private func endCountdown() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        loginView.sendCodeLabel.isUserInteractionEnabled = true
        let attributedString = NSMutableAttributedString(string: "Get code")
        attributedString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: "Get code".count)
        )
        loginView.sendCodeLabel.attributedText = attributedString
    }
    
    private func codeInfo() {
        ViewHudConfig.showLoading()
        let hat = self.loginView.phoneTx.text ?? ""
        let dict = ["hat": hat]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/similarly", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    self.startCountdown()
                }
                let circular = success.circular ?? ""
                ToastShowConfig.showMessage(form: self.view, message: circular)
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func voiceInfo() {
        ViewHudConfig.showLoading()
        let hat = self.loginView.phoneTx.text ?? ""
        let dict = ["hat": hat]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/segment", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                let circular = success.circular ?? ""
                ToastShowConfig.showMessage(form: self.view, message: circular)
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func loginInfo() {
        let recollect = self.loginView.phoneTx.text ?? ""
        let mine = self.loginView.codeTx.text ?? ""
        if recollect.isEmpty {
            ToastShowConfig.showMessage(form: self.view, message: "Please Input Your Phone")
            return
        }
        if mine.isEmpty {
            ToastShowConfig.showMessage(form: self.view, message: "Please Input Your Code")
            return
        }
        ViewHudConfig.showLoading()
        let dict = ["recollect": recollect, "mine": mine]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/wedge", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    let phone = success.net?.recollect ?? ""
                    let token = success.net?.attachment ?? ""
                    LoginConfig.saveLoginInfo(from: phone, token: token)
                    DispatchQueue.main.async {
                        self.rootInfo()
                    }
                }
                let circular = success.circular ?? ""
                ToastShowConfig.showMessage(form: self.view, message: circular)
                break
            case .failure(_):
                break
            }
        }
    }
    
}
