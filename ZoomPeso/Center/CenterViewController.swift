//
//  CenterViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/21.
//

import UIKit

class CenterViewController: BaseViewController {
    
    lazy var centerView: CenterView = {
        let centerView = CenterView()
        return centerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(centerView)
        centerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        centerView.oneBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let oVc = OrderListViewController()
            oVc.orderType = "4"
            oVc.nameType = "All"
            self.navigationController?.pushViewController(oVc, animated: true)
        }).disposed(by: disposeBag)
        
        centerView.twoBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let oVc = OrderListViewController()
            oVc.orderType = "7"
            oVc.nameType = "Apply"
            self.navigationController?.pushViewController(oVc, animated: true)
        }).disposed(by: disposeBag)
        
        centerView.threeBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let oVc = OrderListViewController()
            oVc.orderType = "6"
            oVc.nameType = "Repayment"
            self.navigationController?.pushViewController(oVc, animated: true)
        }).disposed(by: disposeBag)
        
        centerView.fourBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let oVc = OrderListViewController()
            oVc.orderType = "5"
            oVc.nameType = "Finished"
            self.navigationController?.pushViewController(oVc, animated: true)
        }).disposed(by: disposeBag)
        
        centerView.modelBlock = { [weak self] model in
            guard let self = self else { return }
            let sucking = model.sucking ?? ""
            if sucking.contains(SCREME_URL) {
                scUrlGoVc(with: sucking)
            }else {
                let webVc = VitamainFiveViewController()
                webVc.pageUrl = model.sucking ?? ""
                self.navigationController?.pushViewController(webVc, animated: true)
            }
        }
        
        getApiInfo()
    }
    
    private func scUrlGoVc(with suck: String) {
        if suck.contains("finds") {
            let setVc = SettingViewController()
            self.navigationController?.pushViewController(setVc, animated: true)
        }else if suck.contains("Emperor") {
            self.rootInfo()
        }else if suck.contains("this") {
            LoginConfig.deleteLoginInfo()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.rootInfo()
            }
        }else if suck.contains("itself") {
            let dict = URLParameterParser.parse(from: suck)
            let fitted = dict["fitted"] ?? ""
            let listVc = OrderListViewController()
            if fitted == "0" {
                listVc.orderType = "4"
                listVc.nameType = "All"
            }else if fitted == "1" {
                listVc.orderType = "7"
                listVc.nameType = "Apply"
            }else if fitted == "2" {
                listVc.orderType = "6"
                listVc.nameType = "Repayment"
            }else if fitted == "3" {
                listVc.orderType = "5"
                listVc.nameType = "Finished"
            }
            self.navigationController?.pushViewController(listVc, animated: true)
        }else if suck.contains("during") {
            let dict = URLParameterParser.parse(from: suck)
            let barricaded = dict["barricaded"] ?? ""
            self.productDetailInfo(from: barricaded) { model in
                self.vitaminInfo(from: model) { model in
                    
                }
            }
        }
    }

}

extension CenterViewController {
    
    private func getApiInfo() {
        ViewHudConfig.showLoading()
        NetworkManager.getRequest(endpoint: "/surely/walckanaer", responseType: BaseModel.self) { result in
            switch result {
            case .success(let success):
                if success.wedge == "0" {
                    if let modelArray = success.net?.ruby {
                        self.centerView.modelArry.accept(modelArray)
                    }
                }
                ViewHudConfig.hideLoading()
                break
            case .failure(_):
                ViewHudConfig.hideLoading()
                break
            }
        }
    }
    
}
