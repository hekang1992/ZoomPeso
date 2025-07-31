
import UIKit
import RxRelay
import AVFoundation
import Photos
import TYAlertController
import AlamofireImage

class XanthineDnaViewController: OaklandLibidoViewController {
        
    var xanthocarpousHatched: String = ""
    
    var operatingModel = BehaviorRelay<netModel?>(value: nil)
    
    var isSuccess = BehaviorRelay<Int?>(value: nil)
    
    var jacamarFacetime: String = ""
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
   
    lazy var oamView: UIImageView = {
        let oamView = UIImageView()
        oamView.image = UIImage(named: "fabledAddAseuthigme")
        oamView.isUserInteractionEnabled = true
        return oamView
    }()
    
    lazy var gabelleMlabel: UILabel = {
        let gabelleMlabel = UILabel.createLabel(font: UIFont(name: kafFont, size: 18)!, textColor: .white, textAlignment: .center)
        gabelleMlabel.text = "Step 1"
        return gabelleMlabel
    }()
    
    lazy var m1label: UILabel = {
        let m1label = UILabel.createLabel(font: UIFont(name: kafFont, size: 15)!, textColor: .black, textAlignment: .left)
        m1label.text = "Demonst" + "ration"
        return m1label
    }()
    
    lazy var triangulationView: UIImageView = {
        let triangulationView = UIImageView()
        triangulationView.image = UIImage(named: "associativeAddSfaceimage")
        triangulationView.layer.cornerRadius = 9
        return triangulationView
    }()
    
    lazy var inheritanceView: UIImageView = {
        let inheritanceView = UIImageView()
        inheritanceView.image = UIImage(named: "rangeIconCaimgesfa")
        return inheritanceView
    }()
    
    lazy var qandaharBtn: UIButton = {
        let qandaharBtn = UIButton(type: .custom)
        qandaharBtn.setTitle("Next", for: .normal)
        qandaharBtn.titleLabel?.font = UIFont(name: kafFont, size: 18.pix())
        qandaharBtn.backgroundColor = .init(cssHexStr: "#FF3825")
        qandaharBtn.setTitleColor(.white, for: .normal)
        qandaharBtn.layer.cornerRadius = 23.5
        return qandaharBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(architectureView)
        architectureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
      
        self.fontView.nabobessLabel.text = "Face" + " " + "recognition"
        addHeadView()
        self.fontView.eventBlock = { [weak self] in
            guard let self = self else { return }
            lateScalableGabe()
        }
        
        
        
        view.addSubview(oamView)
        oamView.addSubview(gabelleMlabel)
        oamView.addSubview(m1label)
        oamView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(fontView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 358.pix(), height: 448.pix()))
        }
        gabelleMlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
        }
        m1label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalTo(gabelleMlabel.snp.bottom).offset(28.pix())
        }
        
        oamView.addSubview(triangulationView)
        triangulationView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(m1label.snp.bottom).offset(13)
            make.size.equalTo(CGSize(width: 313.pix(), height: 167.pix()))
        }
        
        oamView.addSubview(inheritanceView)
        inheritanceView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15.pix())
            make.size.equalTo(CGSize(width: 315.pix(), height: 115.pix()))
        }
        
        view.addSubview(qandaharBtn)
        qandaharBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.bottom.equalToSuperview().offset(-30.pix())
        }
        
        triangulationView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            jacamarFacetime = ServerSideDeviceInfo.currentTimestamp
            DispatchQueue.main.async {
                self.showImageSourceSelection()
            }
        }).disposed(by: identifierBag)
        
        qandaharBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            jacamarFacetime = ServerSideDeviceInfo.currentTimestamp
            let index = self.isSuccess.value ?? 0
            if index == 1 {
                let jaboticabaBarricaded = self.model.value?.yachtswomanEnlarged?.patternOrifice ?? ""
                labialiseModelingAaron(from: jaboticabaBarricaded) { model in
                    self.model.accept(model)
                    self.unwindingHabaneroScalable(from: model) { model in
                        
                    }
                }
            }else {
                DispatchQueue.main.async {
                    self.showImageSourceSelection()
                }
            }
        }).disposed(by: identifierBag)
        
        alphabetizeZahalTabassaran()
        
        isSuccess.asObservable().subscribe(onNext: { [weak self] index in
            guard let self = self else { return }
            if index == 1 {
                triangulationView.isUserInteractionEnabled = false
            }else {
                triangulationView.isUserInteractionEnabled = true
            }
        }).disposed(by: identifierBag)
        
    }
    
}

extension XanthineDnaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private  func showImageSourceSelection() {
        self.drawingVirtualobjUnmanaged()
    }
    
    func drawingVirtualobjUnmanaged() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            alphabeticallyWaddingInline()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        self.alphabeticallyWaddingInline()
                    } else {
                        self.showPermissionDeniedAlert(for: "Camera")
                    }
                }
            }
        case .denied, .restricted:
            showPermissionDeniedAlert(for: "Camera")
        @unknown default:
            break
        }
    }
    
    func alphabeticallyWaddingInline() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        let illinoisPicker = UIImagePickerController()
        illinoisPicker.sourceType = .camera
        illinoisPicker.delegate = self
        illinoisPicker.cameraDevice = .front
        present(illinoisPicker, animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ illinoisPicker: UIImagePickerController) {
        illinoisPicker.dismiss(animated: true) {
            
        }
    }
    
    func imagePickerController(_ illinoisPicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        illinoisPicker.dismiss(animated: true)
        if let image = info[.originalImage] as? UIImage, let data = image.jpegData(compressionQuality: 0.35)  {
            kabyleGabberLifetime(from: data)
        }
    }
    
    private func kabyleGabberLifetime(from imageData: Data) {
        ViewCycleManager.showLoading()
        let dict = ["stage": "1",
                    "hatched": xanthocarpousHatched,
                    "swab": "zero",
                    "bajada": "10",
                    "dental": "false",
                    "sf": "1"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/attack", parameters: dict, files: ["image": imageData], responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                ViewCycleManager.iterationLibraWaddie()
                guard let self = self else { return }
                if ["0", "00"].contains(success.rabbiWedge) {
                    DispatchQueue.main.async {
                        self.alphabetizeZahalTabassaran()
                    }
                    ScroPortionPointConfig.pointToPageWithModel(with: "4", discreteKstime: jacamarFacetime, jstime: ServerSideDeviceInfo.currentTimestamp)
                }
                ToastManagerConfig.showToastText(form: view, message: success.chainCircular ?? "")
                break
            case .failure(_):
                ViewCycleManager.iterationLibraWaddie()
                break
            }
        }
    }
    
    private func alphabetizeZahalTabassaran() {
        ViewCycleManager.showLoading()
        let jaboticabaBarricaded = self.model.value?.yachtswomanEnlarged?.patternOrifice ?? ""
        let dict = ["barricaded": jaboticabaBarricaded, "vitaman": "d"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/valueCordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.rabbiWedge) {
                    if let model = success.net?.pacewayVictims {
                        self.isSuccess.accept(model.graphStrength ?? 0)
                        let iconUrl = model.alphabeticallySucking ?? ""
                        if let url = URL(string: iconUrl) {
                            self.triangulationView.af.setImage(withURL: url)
                        }
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
