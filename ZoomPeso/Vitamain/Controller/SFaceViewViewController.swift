//
//  SFaceViewViewController.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/22.
//

import UIKit
import RxRelay
import AVFoundation
import Photos
import TYAlertController
import Kingfisher

class SFaceViewViewController: BaseViewController {
    
    var model = BehaviorRelay<netModel?>(value: nil)
    
    var hatched: String = ""
    
    var sfaceModel = BehaviorRelay<netModel?>(value: nil)
    
    var isSuccess = BehaviorRelay<Int?>(value: nil)
    
    lazy var hedImageView: UIImageView = {
        let hedImageView = UIImageView()
        hedImageView.image = UIImage(named: "seigmeiage")
        return hedImageView
    }()
    
    lazy var oneImageView: UIImageView = {
        let oneImageView = UIImageView()
        oneImageView.image = UIImage(named: "aseuthigme")
        oneImageView.isUserInteractionEnabled = true
        return oneImageView
    }()
    
    lazy var mlabel: UILabel = {
        let mlabel = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 18)!, textColor: .white, textAlignment: .center)
        mlabel.text = "Step 1"
        return mlabel
    }()
    
    lazy var m1label: UILabel = {
        let m1label = UILabel.createLabel(font: UIFont(name: ArialBlackFont, size: 15)!, textColor: .black, textAlignment: .left)
        m1label.text = "Demonstration"
        return m1label
    }()
    
    lazy var popImageView: UIImageView = {
        let popImageView = UIImageView()
        popImageView.image = UIImage(named: "sfaceimage")
        popImageView.layer.cornerRadius = 9
        return popImageView
    }()
    
    lazy var scImageView: UIImageView = {
        let scImageView = UIImageView()
        scImageView.image = UIImage(named: "caimgesfa")
        return scImageView
    }()
    
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton(type: .custom)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18.pix())
        nextBtn.backgroundColor = .init(hexStr: "#FF3824")
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.layer.cornerRadius = 23.5
        return nextBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(hedImageView)
        hedImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        
        self.headView.nameLabel.text = "Face recognition"
        addHeadView()
        self.headView.backBlock = { [weak self] in
            guard let self = self else { return }
            popToVitamainGuideOrRoot()
        }
        
        view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(hedImageView.snp.bottom).offset(-20)
        }
        view.addSubview(oneImageView)
        oneImageView.addSubview(mlabel)
        oneImageView.addSubview(m1label)
        oneImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(headView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: 358.pix(), height: 448.pix()))
        }
        mlabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44.pix())
            make.height.equalTo(25.pix())
        }
        m1label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(13)
            make.right.equalToSuperview()
            make.top.equalTo(mlabel.snp.bottom).offset(28.pix())
        }
        
        oneImageView.addSubview(popImageView)
        popImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(m1label.snp.bottom).offset(13)
            make.size.equalTo(CGSize(width: 313.pix(), height: 167.pix()))
        }
        
        oneImageView.addSubview(scImageView)
        scImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15.pix())
            make.size.equalTo(CGSize(width: 315.pix(), height: 115.pix()))
        }
        
        view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 237.pix(), height: 47.pix()))
            make.bottom.equalToSuperview().offset(-30.pix())
        }
        
        popImageView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showImageSourceSelection()
            }
        }).disposed(by: disposeBag)
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let index = self.isSuccess.value ?? 0
            if index == 1 {
                let barricaded = self.model.value?.enlarged?.orifice ?? ""
                productDetailInfo(from: barricaded) { model in
                    self.model.accept(model)
                    self.vitaminInfo(from: model) { model in
                        
                    }
                }
            }else {
                DispatchQueue.main.async {
                    self.showImageSourceSelection()
                }
            }
        }).disposed(by: disposeBag)
        
        getAuthInfo()
        
        isSuccess.asObservable().subscribe(onNext: { [weak self] index in
            guard let self = self else { return }
            if index == 1 {
                popImageView.isUserInteractionEnabled = false
            }else {
                popImageView.isUserInteractionEnabled = true
            }
        }).disposed(by: disposeBag)
        
    }
    
}

extension SFaceViewViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private  func showImageSourceSelection() {
        self.checkCameraPermission()
    }
    
    func checkCameraPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            openCamera()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        self.openCamera()
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
    
    func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            return
        }
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.cameraDevice = .front
        present(picker, animated: true)
        
    }
    
    func showPermissionDeniedAlert(for permission: String) {
        let alert = UIAlertController(
            title: "Permission required",
            message: "Go to Settings to allow \(permission) access for this feature.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Setting", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        })
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        if let image = info[.originalImage] as? UIImage, let data = image.jpegData(compressionQuality: 0.35)  {
            upImageApiInfo(from: data)
        }
    }
    
    private func upImageApiInfo(from imageData: Data) {
        ViewHudConfig.showLoading()
        let dict = ["hatched": hatched,
                    "swab": "zero",
                    "bajada": "10",
                    "dental": "false",
                    "sf": "1"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/attack", parameters: dict, files: ["image": imageData], responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                ViewHudConfig.hideLoading()
                guard let self = self else { return }
                if success.wedge == "0" {
                    DispatchQueue.main.async {
                        self.getAuthInfo()
                    }
                }
                ToastShowConfig.showMessage(form: view, message: success.circular ?? "")
                break
            case .failure(_):
                ViewHudConfig.hideLoading()
                break
            }
        }
    }
    
    private func getAuthInfo() {
        ViewHudConfig.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded, "vitaman": "c"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewHudConfig.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    if let model = success.net?.victims {
                        self.isSuccess.accept(model.strength ?? 0)
                        let picUrl = model.sucking ?? ""
                        self.popImageView.kf.setImage(with: URL(string: picUrl), placeholder: UIImage(named: "sfaceimage"))
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
