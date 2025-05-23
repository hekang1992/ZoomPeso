//
//  SettingViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/23.
//

import UIKit
import TYAlertController

class SettingViewController: BaseViewController {
    
    lazy var hedImageView: UIImageView = {
        let hedImageView = UIImageView()
        hedImageView.image = UIImage(named: "seigmeiage")
        return hedImageView
    }()
    
    lazy var aImageView: UIImageView = {
        let aImageView = UIImageView()
        aImageView.isUserInteractionEnabled = true
        aImageView.image = UIImage(named: "veisongimage")
        return aImageView
    }()
    
    lazy var bImageView: UIImageView = {
        let bImageView = UIImageView()
        bImageView.isUserInteractionEnabled = true
        bImageView.image = UIImage(named: "anndeimgeacimge")
        return bImageView
    }()
    
    lazy var rightImageMainView: UIImageView = {
        let rightImageMainView = UIImageView()
        rightImageMainView.isUserInteractionEnabled = true
        rightImageMainView.image = UIImage(named: "logimged")
        return rightImageMainView
    }()
    
    lazy var vLabel: UILabel = {
        let vLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .medium), textColor: .white, textAlignment: .right)
        vLabel.text = "\(Bundle.main.releaseVersionNumber ?? "")"
        return vLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(hedImageView)
        hedImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        self.headView.nameLabel.text = "Settings"
        addHeadView()
        self.headView.backBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(hedImageView.snp.bottom).offset(-30)
        }
        
        bgView.addSubview(aImageView)
        bgView.addSubview(bImageView)
        bgView.addSubview(rightImageMainView)
        
        aImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        bImageView.snp.makeConstraints { make in
            make.top.equalTo(aImageView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        rightImageMainView.snp.makeConstraints { make in
            make.top.equalTo(bImageView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        
        aImageView.addSubview(vLabel)
        vLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-27.pix())
            make.size.equalTo(CGSize(width: 200, height: 15))
        }
        
        
        rightImageMainView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let outView = OutLogView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
            let alertVc = TYAlertController(alert: outView, preferredStyle: .alert)!
            self.present(alertVc, animated: true)
            outView.block = { [weak self] type in
                guard let self = self else { return }
                accOutInfo(with: type)
            }
        }).disposed(by: disposeBag)
        
        bImageView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let accdelView = AccDelLogView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
            let alertVc = TYAlertController(alert: accdelView, preferredStyle: .alert)!
            self.present(alertVc, animated: true)
            accdelView.block = { [weak self] type in
                guard let self = self else { return }
                accDelInfo(with: type)
            }
        }).disposed(by: disposeBag)
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgView.layer.cornerRadius = 30
        bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bgView.layer.masksToBounds = true
    }
    
}

extension SettingViewController {
    
    private func accOutInfo(with type: String) {
        if type == "0" {
            self.dismiss(animated: true)
        }else {
            self.dismiss(animated: true) {
                ViewCycleManager.showLoading()
                let dict = ["coca": "out",
                            "clean": "0",
                            "search": "1"]
                let man = NetworkRequstManager()
                man.getRequest(endpoint: "/surely/retreating", parameters: dict, responseType: BaseModel.self) { [weak self] result in
                    switch result {
                    case .success(let success):
                        guard let self = self else { return }
                        if ["0", "00"].contains(success.wedge) {
                            LoginConfig.deleteLoginInfo()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                self.notiLastRootVcManager()
                            }
                        }
                        ToastManagerConfig.showToastText(form: view, message: success.circular ?? "")
                        ViewCycleManager.hideLoading()
                        break
                    case .failure(_):
                        ViewCycleManager.hideLoading()
                        break
                    }
                }
            }
        }
    }
    
    private func accDelInfo(with type: String) {
        if type == "0" {
            self.dismiss(animated: true)
        }else {
            self.dismiss(animated: true) {
                ViewCycleManager.showLoading()
                let dict = ["coca": "del",
                            "mask": "1",
                            "share": "0"]
                let man = NetworkRequstManager()
                man.getRequest(endpoint: "/surely/marks", parameters: dict, responseType: BaseModel.self) { [weak self] result in
                    switch result {
                    case .success(let success):
                        guard let self = self else { return }
                        if ["0", "00"].contains(success.wedge) {
                            LoginConfig.deleteLoginInfo()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                self.notiLastRootVcManager()
                            }
                        }
                        ToastManagerConfig.showToastText(form: view, message: success.circular ?? "")
                        ViewCycleManager.hideLoading()
                        break
                    case .failure(_):
                        ViewCycleManager.hideLoading()
                        break
                    }
                }
            }
        }
    }
    
}
