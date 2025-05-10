//
//  VitamainFiveViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/22.
//

import UIKit
import RxRelay
import WebKit
import RxSwift
import StoreKit

class VitamainFiveViewController: BaseViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var ksTime: String = ""
    var jsTime: String = ""
    
    var odNum: String = ""
    
    lazy var webView: WKWebView = {
        let userContentController = WKUserContentController()
        let configuration = WKWebViewConfiguration()
        let scriptNames = ["preparing",
                           "spring",
                           "moved",
                           "thorax",
                           "backwards",
                           "spine",
                           "edge"]
        scriptNames.forEach { userContentController.add(self, name: $0) }
        configuration.userContentController = userContentController
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.scrollViewInfoApple {
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
            $0.bounces = false
            $0.alwaysBounceVertical = false
        }
        webView.navigationDelegate = self
        return webView
    }()
        
    var pageUrl: String?
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor.init(hexStr: "#FF3824")
        progressView.trackTintColor = .lightGray
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        addHeadView()
        self.headView.backBlock = { [weak self] in
            guard let self = self else { return }
            if self.webView.canGoBack {
                self.webView.goBack()
            }else {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(headView.snp.bottom)
        }
        
        headView.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
        
        if let pageUrl = pageUrl {
            var urlString = ""
            let loginDict = LoginConfig.getLoginInfo().toDictionary
            let url = URLQueryConfig.appendQueryDict(to: pageUrl, parameters: loginDict)!
            urlString = url.replacingOccurrences(of: " ", with: "%20")
            if let url = URL(string: urlString) {
                webView.load(URLRequest(url: url))
            }
        }
        
        webView.rx.observe(String.self, "title")
            .subscribe(onNext: { [weak self] title in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.headView.nameLabel.text = title
                }
            }).disposed(by: disposeBag)
        
        webView.rx.observe(Double.self, "estimatedProgress")
            .compactMap { $0 }
            .map { Float($0) }
            .bind(to: progressView.rx.progress)
            .disposed(by: disposeBag)
        
        webView.rx.observe(Double.self, "estimatedProgress")
            .compactMap { $0 }
            .filter { $0 == 1.0 }
            .subscribe(onNext: { [weak self] _ in
                self?.progressView.setProgress(0.0, animated: false)
                self?.progressView.isHidden = true
            })
            .disposed(by: disposeBag)
        
    }
    
}

extension VitamainFiveViewController: WKScriptMessageHandler, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        ViewCycleManager.showLoading()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ViewCycleManager.hideLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ViewCycleManager.hideLoading()
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let messageName = message.name
        if messageName == "spine" {
            ksTime = DeviceInfo.currentTimestamp
        }else if messageName == "edge" {
            jsTime = DeviceInfo.currentTimestamp
            BuyPointConfig.pointToPageWithModel(with: "8", kstime: ksTime, jstime: jsTime, orNo: "")
            let proID = model.value?.enlarged?.orifice ?? ""
            productDetailInfo(from: proID) { [weak self] model in
                let vitamain = model.pepsis?.rolled ?? ""
                if vitamain.isEmpty {
                    self?.odIDWithString(with: model)
                }
            }
        }else if messageName == "backwards" {
            let tenTime = DeviceInfo.currentTimestamp
            BuyPointConfig.pointToPageWithModel(with: "10", kstime: tenTime, jstime: tenTime, orNo: odNum)
        }else if messageName == "thorax" {
            requestAppReview()
        }else if messageName == "preparing" {
            self.popToVitamainGuideOrRoot()
        }else if messageName == "moved" {
            self.notiLastRootVcManager()
        }
    }
    
    func requestAppReview() {
        if #available(iOS 14.0, *), let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
    
    private func odIDWithString(with model: netModel) {
        ViewCycleManager.showLoading()
        let odID = model.enlarged?.tyrant ?? ""
        let mon = String(model.enlarged?.characterized ?? 0)
        let uvring = model.enlarged?.casts ?? ""
        let semicircular = String(model.enlarged?.semicircular ?? 0)
        let soul = "mate"
        let dict = ["contest": odID,
                    "characterized": mon,
                    "casts": uvring,
                    "semicircular": semicircular,
                    "soul": soul]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/mine", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                guard let self = self else { return }
                ViewCycleManager.hideLoading()
                if success.wedge == "0" || success.wedge == "00" {
                    let pageUrl = success.net?.sucking ?? ""
                    var urlString = ""
                    let loginDict = LoginConfig.getLoginInfo().toDictionary
                    let url = URLQueryConfig.appendQueryDict(to: pageUrl, parameters: loginDict)!
                    urlString = url.replacingOccurrences(of: " ", with: "%20")
                    if let url = URL(string: urlString) {
                        webView.load(URLRequest(url: url))
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        let time = DeviceInfo.currentTimestamp
                        BuyPointConfig.pointToPageWithModel(with: "9", kstime: time, jstime: time, orNo: odID)
                    }
                }
                break
            case .failure(_):
                ViewCycleManager.hideLoading()
                break
            }
        }
    }
    
}

extension UIScrollView {
    func scrollViewInfoApple(_ configuration: (UIScrollView) -> Void) {
        configuration(self)
    }
}


class BuyPointConfig {
    
    static func pointToPageWithModel(with type: String, kstime: String, jstime: String, orNo: String = "") {
        let shuffled = DeviceIDManager.shared.getDeviceID()
        let forceps = DeviceIDManager.shared.getIDFA()
        var dict = ["closing": type, "instrument": "2", "shuffled": shuffled, "forceps": forceps, "cautiously": kstime, "uses": jstime, "vertically": orNo]
        let location = LocationConfig()
        location.getLocationInfo { model in
            let locationDict = ["disappointed": String(model.disappointed ?? 0.0), "coleoptera": String(model.coleoptera ?? 0.0)]
            dict.merge(locationDict) { current, _ in current }
            DispatchQueue.global(qos: .background).async {
                BuyPointConfig.apiInfo(wit: dict)
            }
        }
    }
    
    static func apiInfo(wit dict: [String: String]) {
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/paraguay", parameters: dict, responseType: BaseModel.self) { result in
            switch result {
            case .success(_):
                break
            case .failure(_):
                break
            }
        }
    }
    
}
