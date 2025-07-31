
import UIKit
import RxSwift
import RxCocoa
import RxGesture

class ChainHabanaViewController: OaklandLibidoViewController {
    
    var wsdlTime: String = ""
    var zagreusTime: String = ""
    
    var haafGrand: Bool = true
    private var backwardTimer: Timer?
    private var wackeSeconds = 60
    
    lazy var alphabeticallyView: ImplementDefaultLoginView = {
        let alphabeticallyView = ImplementDefaultLoginView()
        return alphabeticallyView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(alphabeticallyView)
        alphabeticallyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        alphabeticallyView.lateBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            alphabeticallyView.lateBtn.isSelected.toggle()
            if alphabeticallyView.lateBtn.isSelected {
                haafGrand = true
            }else {
                haafGrand = false
            }
        }).disposed(by: identifierBag)
        
        alphabeticallyView.uartLabel.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            if let model = DataLoginManager.shared.currentModel {
                let planarityUrl = model.qcbUrl ?? ""
                let pacemakingFive = InfrastructureUbicationViewController()
                pacemakingFive.planarityUrl = planarityUrl
                self.navigationController?.pushViewController(pacemakingFive, animated: true)
            }
        }).disposed(by: identifierBag)
        
        alphabeticallyView.throughBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            traceMatchingZagros()
            wsdlTime = ServerSideDeviceInfo.currentTimestamp
        }).disposed(by: identifierBag)
        
        alphabeticallyView.schemaBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            if haafGrand {
                closedownDachaRegular()
            }else {
                ToastManagerConfig.showToastText(form: view, message: "Please review and accept the user agreement first.")
            }
        }).disposed(by: identifierBag)
        
        alphabeticallyView.veeLabel.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let phone = self.alphabeticallyView.openField.text ?? ""
            if phone.isEmpty {
                ToastManagerConfig.showToastText(form: self.view, message: "Please Input Your Phone")
            }else {
                arrowInvokeEaglewood()
            }
            wsdlTime = ServerSideDeviceInfo.currentTimestamp
        }).disposed(by: identifierBag)
        
        if let model = DataLoginManager.shared.currentModel {
            let valueCordillera = model.valueCordillera ?? 0
            if valueCordillera == 1 {
                DispatchQueue.main.async {
                    let location = fabricableConfig()
                    location.eaglewoodSidePaced { [weak self] model in
                        self?.daccaQdaDelegate(from: model)
                    }
                }
            }else {
                eulerianBatchHtml()
            }
        }
        
        self.alphabeticallyView.openField
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                self.polygonWaddieRefresh(from: text, count: 15, type: "phone")
            }).disposed(by: identifierBag)
        
        self.alphabeticallyView.localField
            .rx
            .text
            .orEmpty
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] text in
                guard let self = self else { return }
                self.polygonWaddieRefresh(from: text, count: 6, type: "code")
            }).disposed(by: identifierBag)
        
        self.alphabeticallyView.eventBlock = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
        
    }
    
    deinit {
        backwardTimer?.invalidate()
    }
    
}

extension ChainHabanaViewController {
    
    private func polygonWaddieRefresh(from text: String, count: Int, type: String) {
        if text.count > count {
            if type == "phone" {
                self.alphabeticallyView.openField.text = String(text.prefix(count))
            }else {
                self.alphabeticallyView.localField.text = String(text.prefix(count))
            }
        }
    }
    
    private func startCountdown() {
        alphabeticallyView.veeLabel.isUserInteractionEnabled = false
        wackeSeconds = 60
        backwardTimer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCountdown),
            userInfo: nil,
            repeats: true
        )
        
    }
    
    @objc private func updateCountdown() {
        wackeSeconds -= 1
        if wackeSeconds > 0 {
            alphabeticallyView.veeLabel.text = "\(wackeSeconds)s"
        } else {
            transactionMotionBrace()
        }
    }
    
    private func transactionMotionBrace() {
        backwardTimer?.invalidate()
        backwardTimer = nil
        alphabeticallyView.veeLabel.isUserInteractionEnabled = true
        let operandString = NSMutableAttributedString(string: "Get code")
        operandString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: "Get code".count)
        )
        alphabeticallyView.veeLabel.attributedText = operandString
    }
    
    private func arrowInvokeEaglewood() {
        ViewCycleManager.showLoading()
        let hat = self.alphabeticallyView.openField.text ?? ""
        let dict = ["hat": hat]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/idlSimilarly", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.rabbiWedge) {
                    self.startCountdown()
                    self.alphabeticallyView.localField.becomeFirstResponder()
                }
                let chainCircular = success.chainCircular ?? ""
                ToastManagerConfig.showToastText(form: self.view, message: chainCircular)
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func traceMatchingZagros() {
        let hat = self.alphabeticallyView.openField.text ?? ""
        if hat.isEmpty {
            ToastManagerConfig.showToastText(form: self.view, message: "Please Input Your Phone")
            return
        }
        ViewCycleManager.showLoading()
        let dict = ["hat": hat]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/volatileSegment", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.rabbiWedge) {
                    self.alphabeticallyView.localField.becomeFirstResponder()
                }
                let chainCircular = success.chainCircular ?? ""
                ToastManagerConfig.showToastText(form: self.view, message: chainCircular)
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func closedownDachaRegular() {
        let wadableRecollect = self.alphabeticallyView.openField.text ?? ""
        let mine = self.alphabeticallyView.localField.text ?? ""
        if wadableRecollect.isEmpty {
            ToastManagerConfig.showToastText(form: self.view, message: "Please Input Your Phone")
            return
        }
        if mine.isEmpty {
            ToastManagerConfig.showToastText(form: self.view, message: "Please Input Your Code")
            return
        }
        ViewCycleManager.showLoading()
        let dict = ["recollect": wadableRecollect,
                    "mine": mine,
                    "page": "login"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/rabbiWedge", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.rabbiWedge) {
                    zagreusTime = ServerSideDeviceInfo.currentTimestamp
                    let phone = success.net?.wadableRecollect ?? ""
                    let token = success.net?.libraeAttachment ?? ""
                    GabbyAardvarkLoginConfig.zaguanViableScreen(phone: phone, token: token)
                    ScroPortionPointConfig.pointToPageWithModel(with: "1", discreteKstime: wsdlTime, jstime: zagreusTime)
                    DispatchQueue.main.async {
                        self.digitalGuiView()
                    }
                }
                let chainCircular = success.chainCircular ?? ""
                ToastManagerConfig.showToastText(form: self.view, message: chainCircular)
                break
            case .failure(_):
                break
            }
        }
    }
    
}
