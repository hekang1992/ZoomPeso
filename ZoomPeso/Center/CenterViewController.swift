//
//  CenterViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
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
            let schemeURL = AppURL.schemeURL
            if sucking.contains(schemeURL) {
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
            self.notiLastRootVcManager()
        }else if suck.contains("this") {
            LoginConfig.deleteLoginInfo()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                self.notiLastRootVcManager()
            }
        }else if suck.contains("itself") {
            let dict = URLParameterParser.parse(from: suck)
            let fitted = dict["fitted"] ?? ""
            let listVc = OrderListViewController()
            let statusMap: [String: (orderType: String, nameType: String)] = [
                "0": ("4", "All"),
                "1": ("7", "Apply"),
                "2": ("6", "Repayment"),
                "3": ("5", "Finished")
            ]
            if let mapped = statusMap[fitted] {
                listVc.orderType = mapped.orderType
                listVc.nameType = mapped.nameType
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
        ViewCycleManager.showLoading()
        let man = NetworkRequstManager()
        man.getRequest(endpoint: "/surely/walckanaer", responseType: BaseModel.self) { result in
            switch result {
            case .success(let success):
                if success.wedge == "0" {
                    if let modelArray = success.net?.ruby {
                        self.centerView.modelArry.accept(modelArray)
                    }
                }
                ViewCycleManager.hideLoading()
                break
            case .failure(_):
                ViewCycleManager.hideLoading()
                break
            }
        }
    }
    
}
