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
        
        loginView.loginBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            if grand {
                
            }else {
                
            }
        }).disposed(by: disposeBag)
        
        loginView.sendCodeLabel.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            startCountdown()
        }).disposed(by: disposeBag)
    }
    
    deinit {
        countdownTimer?.invalidate()
    }
    
}

extension LoginViewController {
    
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
    
    
}
