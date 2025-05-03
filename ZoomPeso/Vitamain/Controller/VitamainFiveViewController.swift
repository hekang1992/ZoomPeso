//
//  VitamainFiveViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay
import WebKit
import RxSwift

class VitamainFiveViewController: BaseViewController {
    
    var ksTime: String = ""
    var jsTime: String = ""
    
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
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
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
            let loginDict = LoginConfig.getLoginInfo()
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
        ViewHudConfig.showLoading()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ViewHudConfig.hideLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ViewHudConfig.hideLoading()
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let messageName = message.name
        if messageName == "spine" {
            ksTime = DeviceInfo.currentTimestamp
        }else if messageName == "edge" {
            jsTime = DeviceInfo.currentTimestamp
            BuyPointConfig.pointToPageWithModel(with: "8", kstime: ksTime, jstime: jsTime, orNo: "")
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
            BuyPointConfig.apiInfo(wit: dict)
        }
    }
    
    static func apiInfo(wit dict: [String: String]) {
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/paraguay", parameters: dict, responseType: BaseModel.self) { result in
            switch result {
            case .success(_):
                break
            case .failure(_):
                break
            }
        }
    }
    
}
