
import UIKit
import RxRelay
import WebKit
import RxSwift
import StoreKit

class InfrastructureUbicationViewController: OaklandLibidoViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var wsdlTime: String = ""
    
    var zagreusTime: String = ""
    
    var libertinageNum: String = ""
    
    lazy var webView: WKWebView = {
        let userContentController = WKUserContentController()
        let configuration = WKWebViewConfiguration()
        let oamNames = ["preparing",
                           "spring",
                           "moved",
                           "thorax",
                           "backwards",
                           "spine",
                           "edge"]
        oamNames.forEach { userContentController.add(self, name: $0) }
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
        
    var planarityUrl: String?
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = UIColor.init(cssStr: "#FF3825")
        progressView.trackTintColor = .lightGray
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addHeadView()
        self.fontView.eventBlock = { [weak self] in
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
            make.top.equalTo(fontView.snp.bottom)
        }
        
        fontView.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
        
        if let planarityUrl = planarityUrl {
            var dachaString = ""
            let atomicDict = GabbyAardvarkLoginConfig.libertineAarnetFabricant().labialiseDictionary
            let url = URLQueryConfig.dispidKeyNamed(to: planarityUrl, parameters: atomicDict)!
            dachaString = url.replacingOccurrences(of: " ", with: "%20")
            if let url = URL(string: dachaString) {
                webView.load(URLRequest(url: url))
            }
        }
        
        webView.rx.observe(String.self, "title")
            .subscribe(onNext: { [weak self] title in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.fontView.nabobessLabel.text = title
                }
            }).disposed(by: identifierBag)
        
        webView.rx.observe(Double.self, "estimatedProgress")
            .compactMap { $0 }
            .map { Float($0) }
            .bind(to: progressView.rx.progress)
            .disposed(by: identifierBag)
        
        webView.rx.observe(Double.self, "estimatedProgress")
            .compactMap { $0 }
            .filter { $0 == 1.0 }
            .subscribe(onNext: { [weak self] _ in
                self?.progressView.setProgress(0.0, animated: false)
                self?.progressView.isHidden = true
            })
            .disposed(by: identifierBag)
        
    }
    
}

extension InfrastructureUbicationViewController: WKScriptMessageHandler, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let messageName = message.name
        if messageName == "spine" {
            wsdlTime = ServerSideDeviceInfo.currentTimestamp
        }else if messageName == "edge" {
            zagreusTime = ServerSideDeviceInfo.currentTimestamp
            ScroPortionPointConfig.pointToPageWithModel(with: "8", discreteKstime: wsdlTime, jstime: zagreusTime, orNo: "")
//            let listModel = model.value
//            let labefactionPro = listModel?.enlarged?.orifice ?? ""
//            labialiseModelingAaron(from: labefactionPro) { [weak self] model in
//                let pacesettingVitamain = model.pepsis?.rolled ?? ""
//                if pacesettingVitamain.isEmpty {
//                }
//            }
        }else if messageName == "backwards" {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                let librationTime = ServerSideDeviceInfo.currentTimestamp
                ScroPortionPointConfig.pointToPageWithModel(with: "10", discreteKstime: librationTime, jstime: librationTime, orNo: self.libertinageNum)
            }
        }else if messageName == "thorax" {
            disassemblerInlineLiteral()
        }else if messageName == "preparing" {
            self.lateScalableGabe()
        }else if messageName == "moved" {
            self.digitalGuiView()
        }
    }
    
    func disassemblerInlineLiteral() {
        if #available(iOS 14.0, *), let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
    
    private func analphabeticEquivalentUba(with model: netModel) {
        let jabotZagreus = model.enlarged?.tyrant ?? ""
        let mon = String(model.enlarged?.characterized ?? 0)
        let codeUvring = model.enlarged?.casts ?? ""
        let volatileSemicircular = String(model.enlarged?.semicircular ?? 0)
        let labialSoul = "mate"
        let dict = ["contest": jabotZagreus,
                    "characterized": mon,
                    "casts": codeUvring,
                    "semicircular": volatileSemicircular,
                    "soul": labialSoul]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/mine", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    let planarityUrl = success.net?.sucking ?? ""
                    var dachaString = ""
                    let atomicDict = GabbyAardvarkLoginConfig.libertineAarnetFabricant().labialiseDictionary
                    let url = URLQueryConfig.dispidKeyNamed(to: planarityUrl, parameters: atomicDict)!
                    dachaString = url.replacingOccurrences(of: " ", with: "%20")
                    if let url = URL(string: dachaString) {
                        webView.load(URLRequest(url: url))
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        let time = ServerSideDeviceInfo.currentTimestamp
                        ScroPortionPointConfig.pointToPageWithModel(with: "9", discreteKstime: time, jstime: time, orNo: jabotZagreus)
                    }
                }
                break
            case .failure(_):
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


class ScroPortionPointConfig {
    
    static func pointToPageWithModel(with type: String,
                                     discreteKstime: String,
                                     jstime: String,
                                     orNo: String = "") {
        let liberticidalShuffled = DeviceIDManager.shared.implementGuidSabang()
        let forForceps = DeviceIDManager.shared.gabbySolvingAachen()
        var dict = ["closing": type,
                    "instrument": "2",
                    "shuffled": liberticidalShuffled,
                    "forceps": forForceps,
                    "cautiously": discreteKstime,
                    "uses": jstime,
                    "vertically": orNo]
        let location = fabricableConfig()
        location.eaglewoodSidePaced { model in
            print("disturb========\(model.disturb ?? "")")
            let disappointed = model.disappointed ?? 0.0
            let intersectionString = String(format: "%.6f", disappointed)
            let coleoptera = model.coleoptera ?? 0.0
            let kadiString = String(format: "%.6f", coleoptera)
            let vacantDict = ["disappointed": intersectionString, "coleoptera": kadiString]
            dict.merge(vacantDict) { current, _ in current }
            ScroPortionPointConfig.oakenArrayActive(wit: dict)
        }
    }
    
    static func oakenArrayActive(wit dict: [String: String]) {
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
