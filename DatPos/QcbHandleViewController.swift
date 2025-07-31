
import UIKit
import RxRelay
import AVFoundation
import Photos
import TYAlertController
import AlamofireImage

class QcbHandleViewController: OaklandLibidoViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
        
    var labeEnthusiastic: String = ""
    
    var xanthocarpousHatched: String = ""
    
    var mabelaModel = BehaviorRelay<netModel?>(value: nil)
    
    var isSuccess = BehaviorRelay<Int?>(value: nil)
    
    var backwardTime: String = ""
    
   
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
        m1label.text = "Demonstration"
        return m1label
    }()
    
    lazy var triangulationView: UIImageView = {
        let triangulationView = UIImageView()
        triangulationView.image = UIImage(named: "libertyBackPheoamigesi")
        triangulationView.layer.cornerRadius = 9
        return triangulationView
    }()
    
    lazy var inheritanceView: UIImageView = {
        let inheritanceView = UIImageView()
        inheritanceView.image = UIImage(named: "batchRabbinicImagekind")
        return inheritanceView
    }()
    
    lazy var qandaharBtn: UIButton = {
        let qandaharBtn = UIButton(type: .custom)
        qandaharBtn.setTitle("Next", for: .normal)
        qandaharBtn.titleLabel?.font = UIFont(name: kafFont, size: 18.pix())
        qandaharBtn.backgroundColor = .init(cssStr: "#FF3825")
        qandaharBtn.setTitleColor(.white, for: .normal)
        qandaharBtn.layer.cornerRadius = 23.5
        return qandaharBtn
    }()
    
    lazy var unqualifiedView: RightDemarshalSubView = {
        let unqualifiedView = RightDemarshalSubView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        return unqualifiedView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(architectureView)
        architectureView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.fontView.nabobessLabel.text = "Authentication Security"
        addHeadView()
        self.fontView.eventBlock = { [weak self] in
            guard let self = self else { return }
            let index = self.isSuccess.value ?? 0
            if index == 1 {
                lateScalableGabe()
            }else {
                self.navigationController?.popViewController(animated: true)
            }
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
            backwardTime = ServerSideDeviceInfo.currentTimestamp
            DispatchQueue.main.async {
                self.showImageSourceSelection()
            }
        }).disposed(by: identifierBag)
        
        
        qandaharBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            backwardTime = ServerSideDeviceInfo.currentTimestamp
            let index = self.isSuccess.value ?? 0
            if index == 1 {
                let libertineSfc = XanthineDnaViewController()
                libertineSfc.model.accept(self.model.value)
                self.navigationController?.pushViewController(libertineSfc, animated: true)
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

extension QcbHandleViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private  func showImageSourceSelection() {
        let alert = UIAlertController(
            title: "Select Image Source",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
            self.xanthocarpousHatched = "1"
            self.drawingVirtualobjUnmanaged()
        })
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.xanthocarpousHatched = "2"
            self.veeConvexIncremental()
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
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
    
    func veeConvexIncremental() {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized, .limited:
            macacoPacesetterTransaction()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                DispatchQueue.main.async {
                    if newStatus == .authorized || newStatus == .limited {
                        self.macacoPacesetterTransaction()
                    } else {
                        self.showPermissionDeniedAlert(for: "Photo Library")
                    }
                }
            }
        case .denied, .restricted:
            showPermissionDeniedAlert(for: "Photo Library")
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
        present(illinoisPicker, animated: true)
    }
    
    func macacoPacesetterTransaction() {
        let illinoisPicker = UIImagePickerController()
        illinoisPicker.sourceType = .photoLibrary
        illinoisPicker.delegate = self
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
        let dict = ["hatched": xanthocarpousHatched,
                    "swab": "zero",
                    "enthusiastic": labeEnthusiastic,
                    "bajada": "11",
                    "dental": "false"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/attack", parameters: dict, files: ["image": imageData], responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                ViewCycleManager.iterationLibraWaddie()
                guard let self = self else { return }
                if let model = success.net {
                if ["0", "00"].contains(success.wedge) {
                        DispatchQueue.main.async {
                            self.xanthochroiBaaskaapVaalhaai(from: model)
                        }
                    }
                }
                ToastManagerConfig.showToastText(form: unqualifiedView, message: success.circular ?? "")
                break
            case .failure(_):
                ViewCycleManager.iterationLibraWaddie()
                break
            }
        }
    }
    
    private func xanthochroiBaaskaapVaalhaai(from model: netModel) {
        let cabaneAlert = TYAlertController(alert: unqualifiedView, preferredStyle: .actionSheet)!
        unqualifiedView.model.accept(model)
        self.present(cabaneAlert, animated: true)
        
        unqualifiedView.qandaharBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            imeCheckpointVector(form: unqualifiedView)
        }).disposed(by: identifierBag)
        
        unqualifiedView.block = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
        
        unqualifiedView.cliBlock = { [weak self] in
            guard let self = self else { return }
            unqualifiedView.jacanaName.resignFirstResponder()
            unqualifiedView.yachtswomanFor.resignFirstResponder()
            let packagingView = DacIdlDateView(frame: .zero)
            oakletRowsetVariable(with: packagingView, superView: unqualifiedView)
        }
        
    }
    
    private func oakletRowsetVariable(with packagingView: DacIdlDateView, superView: RightDemarshalSubView) {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                return
            }
            window.addSubview(packagingView)
            packagingView.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
            }
            let listStrTraveling = superView.randomBtn.titleLabel?.text ?? ""
            packagingView.listStrTraveling = listStrTraveling
            
            packagingView.dachshundBlock = { time in
                superView.randomBtn.setTitle(time, for: .normal)
            }
            
            packagingView.poolingBtn.rx.tap.subscribe(onNext: {
                packagingView.removeFromSuperview()
            }).disposed(by: self.identifierBag)
        }
    }
    
    private func imeCheckpointVector(form tcView: RightDemarshalSubView) {
        ViewCycleManager.showLoading()
        let name = unqualifiedView.jacanaName.text ?? ""
        let remoteIdnum = unqualifiedView.yachtswomanFor.text ?? ""
        let time = unqualifiedView.randomBtn.titleLabel?.text ?? ""
        let dict = ["stuff": time,
                    "sting": remoteIdnum,
                    "grand": "1",
                    "trace": "99",
                    "paralysed": name,
                    "bajada": "11",
                    "enthusiastic": labeEnthusiastic]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/sexes", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    self.dismiss(animated: true) {
                        self.alphabetizeZahalTabassaran()
                    }
                    ScroPortionPointConfig.pointToPageWithModel(with: "3", discreteKstime: backwardTime, jstime: ServerSideDeviceInfo.currentTimestamp)
                }
                ToastManagerConfig.showToastText(form: unqualifiedView, message: success.circular ?? "")
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func alphabetizeZahalTabassaran() {
        ViewCycleManager.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded,
                    "vitaman": "c",
                    "macdown": "1"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.iterationLibraWaddie()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if ["0", "00"].contains(success.wedge) {
                    if let model = success.net?.deadly {
                        self.isSuccess.accept(model.strength ?? 0)
                        let iconUrl = model.sucking ?? ""
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
