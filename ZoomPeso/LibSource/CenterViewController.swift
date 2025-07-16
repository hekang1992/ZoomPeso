//
//  CenterViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit

class CenterViewController: BaseViewController {
    
    let oneArray = ["All", "Apply"]
    let twoArray = ["Repayment", "Finished"]
    
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
        
        centerView.modelBlock = { [weak self] model in
            guard let self = self else { return }
            judgeIsLogin()
            let sucking = model.sucking ?? ""
            let schemeURL = AppURL.schemeURL
            if sucking.contains(schemeURL) {
                scUrlGoVc(with: sucking)
            }else {
                let webVc = WebDynamicViewController()
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
            do {
                let params = try URLParameterParser.parseWithUrl(from: suck)
                let fitted = params["fitted"] ?? ""
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
            } catch {
                print("Failed to parse URL parameters:", error)
            }
        }else if suck.contains("during") {
            do {
                let params = try URLParameterParser.parseWithUrl(from: suck)
                let barricaded = params["barricaded"] ?? ""
                self.productDetailInfo(from: barricaded) { model in
                    self.vitaminInfo(from: model) { model in
                        
                    }
                }
            } catch {
                print("Failed to parse URL parameters:", error)
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
                if ["0", "00"].contains(success.wedge) {
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
