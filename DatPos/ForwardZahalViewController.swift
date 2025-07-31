
import UIKit
import TYAlertController

class ForwardZahalViewController: OaklandLibidoViewController {
    
    lazy var viewView: UIImageView = {
        let viewView = UIImageView()
        viewView.image = UIImage(named: "eacmImageSeigmeiage")
        return viewView
    }()
    
    lazy var linkerView: UIImageView = {
        let linkerView = UIImageView()
        linkerView.isUserInteractionEnabled = true
        linkerView.image = UIImage(named: "vacantVaaljapieVeisongimage")
        return linkerView
    }()
    
    lazy var wadableView: UIImageView = {
        let wadableView = UIImageView()
        wadableView.isUserInteractionEnabled = true
        wadableView.image = UIImage(named: "approximateIconAnndeimgeacimge")
        return wadableView
    }()
    
    lazy var yachtyView: UIImageView = {
        let yachtyView = UIImageView()
        yachtyView.isUserInteractionEnabled = true
        yachtyView.image = UIImage(named: "uartImageLogimged")
        return yachtyView
    }()
    
    lazy var dnaLabel: UILabel = {
        let dnaLabel = UILabel.createLabel(font: UIFont.systemFont(ofSize: 15, weight: .medium), textColor: .black, textAlignment: .right)
        dnaLabel.text = "\(Bundle.main.sabaothNumber ?? "")"
        return dnaLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(viewView)
        viewView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        self.fontView.nabobessLabel.text = "Settings"
        addHeadView()
        self.fontView.eventBlock = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        view.addSubview(architectureView)
        architectureView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(viewView.snp.bottom).offset(-30)
        }
        
        architectureView.addSubview(linkerView)
        architectureView.addSubview(wadableView)
        architectureView.addSubview(yachtyView)
        
        linkerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        wadableView.snp.makeConstraints { make in
            make.top.equalTo(linkerView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        yachtyView.snp.makeConstraints { make in
            make.top.equalTo(wadableView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 346.pix(), height: 90.pix()))
            make.centerX.equalToSuperview()
        }
        
        
        linkerView.addSubview(dnaLabel)
        dnaLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-27.pix())
            make.size.equalTo(CGSize(width: 200, height: 15))
        }
        
        
        yachtyView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let writeView = DacoitMiddlewareLogView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
            let cabaneAlert = TYAlertController(alert: writeView, preferredStyle: .alert)!
            self.present(cabaneAlert, animated: true)
            writeView.block = { [weak self] type in
                guard let self = self else { return }
                libidinousDispidPointer(with: type)
            }
        }).disposed(by: identifierBag)
        
        wadableView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            let jabotView = RecursiveBugLogView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
            let cabaneAlert = TYAlertController(alert: jabotView, preferredStyle: .alert)!
            self.present(cabaneAlert, animated: true)
            jabotView.block = { [weak self] type in
                guard let self = self else { return }
                oakmossPixelBinding(with: type)
            }
        }).disposed(by: identifierBag)
        
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        architectureView.layer.cornerRadius = 30
        architectureView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        architectureView.layer.masksToBounds = true
    }
    
}

extension ForwardZahalViewController {
    
    private func libidinousDispidPointer(with type: String) {
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
                        if ["0", "00"].contains(success.rabbiWedge) {
                            GabbyAardvarkLoginConfig.deleteLoginInfo()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                self.digitalGuiView()
                            }
                        }
                        ToastManagerConfig.showToastText(form: view, message: success.chainCircular ?? "")
                        ViewCycleManager.iterationLibraWaddie()
                        break
                    case .failure(_):
                        ViewCycleManager.iterationLibraWaddie()
                        break
                    }
                }
            }
        }
    }
    
    private func oakmossPixelBinding(with type: String) {
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
                        if ["0", "00"].contains(success.rabbiWedge) {
                            GabbyAardvarkLoginConfig.deleteLoginInfo()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                self.digitalGuiView()
                            }
                        }
                        ToastManagerConfig.showToastText(form: view, message: success.chainCircular ?? "")
                        ViewCycleManager.iterationLibraWaddie()
                        break
                    case .failure(_):
                        ViewCycleManager.iterationLibraWaddie()
                        break
                    }
                }
            }
        }
    }
    
}
