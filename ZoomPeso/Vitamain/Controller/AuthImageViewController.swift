//
//  AuthImageViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/22.
//

import UIKit
import RxRelay
import AVFoundation
import Photos
import TYAlertController
import Kingfisher

class AuthImageViewController: BaseViewController {
        
    var enthusiastic: String = ""
    
    var hatched: String = ""
    
    var photoModel = BehaviorRelay<netModel?>(value: nil)
    
    var isSuccess = BehaviorRelay<Int?>(value: nil)
    
    var selectTime: String = ""
    
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
        popImageView.image = UIImage(named: "pheoamigesi")
        popImageView.layer.cornerRadius = 9
        return popImageView
    }()
    
    lazy var scImageView: UIImageView = {
        let scImageView = UIImageView()
        scImageView.image = UIImage(named: "imagekind")
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
    
    lazy var authView: APView = {
        let authView = APView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        return authView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.addSubview(hedImageView)
        hedImageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(136.pix())
        }
        
        self.headView.nameLabel.text = "Authentication Security"
        addHeadView()
        self.headView.backBlock = { [weak self] in
            guard let self = self else { return }
            let index = self.isSuccess.value ?? 0
            if index == 1 {
                popToVitamainGuideOrRoot()
            }else {
                self.navigationController?.popViewController(animated: true)
            }
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
            selectTime = DeviceInfo.currentTimestamp
            DispatchQueue.main.async {
                self.showImageSourceSelection()
            }
        }).disposed(by: disposeBag)
        
        
        nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            selectTime = DeviceInfo.currentTimestamp
            let index = self.isSuccess.value ?? 0
            if index == 1 {
                let sfcVc = SFaceViewViewController()
                sfcVc.model.accept(self.model.value)
                self.navigationController?.pushViewController(sfcVc, animated: true)
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

extension AuthImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private  func showImageSourceSelection() {
        let alert = UIAlertController(
            title: "Select Image Source",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
            self.hatched = "1"
            self.checkCameraPermission()
        })
        
        alert.addAction(UIAlertAction(title: "PhotoLibrary", style: .default) { _ in
            self.hatched = "2"
            self.checkPhotoLibraryPermission()
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
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
    
    func checkPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized, .limited:
            openPhotoLibrary()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                DispatchQueue.main.async {
                    if newStatus == .authorized || newStatus == .limited {
                        self.openPhotoLibrary()
                    } else {
                        self.showPermissionDeniedAlert(for: "PhotoLibrary")
                    }
                }
            }
        case .denied, .restricted:
            showPermissionDeniedAlert(for: "PhotoLibrary")
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
        present(picker, animated: true)
    }
    
    func openPhotoLibrary() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
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
        ViewCycleManager.showLoading()
        let dict = ["hatched": hatched,
                    "swab": "zero",
                    "enthusiastic": enthusiastic,
                    "bajada": "11",
                    "dental": "false"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/attack", parameters: dict, files: ["image": imageData], responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                ViewCycleManager.hideLoading()
                guard let self = self else { return }
                if let model = success.net {
                if success.wedge == "0" {
                        DispatchQueue.main.async {
                            self.tcViewInfo(from: model)
                        }
                    }
                }
                ToastManagerConfig.showToastText(form: view, message: success.circular ?? "")
                break
            case .failure(_):
                ViewCycleManager.hideLoading()
                break
            }
        }
    }
    
    private func tcViewInfo(from model: netModel) {
        let alertVc = TYAlertController(alert: authView, preferredStyle: .actionSheet)!
        authView.model.accept(model)
        self.present(alertVc, animated: true)
        
        authView.nextBtn.rx.tap.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            sageInfo(form: authView)
        }).disposed(by: disposeBag)
        
        
        authView.block = { [weak self] in
            guard let self = self else { return }
            self.dismiss(animated: true)
        }
        
        authView.timeBlock = { [weak self] in
            guard let self = self else { return }
            let dateView = AuthDateView(frame: .zero)
            toastShowViewWithWindow(with: dateView, superView: authView)
        }
        
    }
    
    private func toastShowViewWithWindow(with dateView: AuthDateView, superView: APView) {
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                return
            }
            window.addSubview(dateView)
            dateView.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.size.equalTo(CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
            }
            
            dateView.saveBlock = { time in
                superView.timeBtn.setTitle(time, for: .normal)
                DispatchQueue.main.async {
                    dateView.removeFromSuperview()
                }
            }
            
            dateView.cancelBtn.rx.tap.subscribe(onNext: {
                dateView.removeFromSuperview()
            }).disposed(by: self.disposeBag)
        }
    }
    
    private func sageInfo(form tcView: APView) {
        ViewCycleManager.showLoading()
        let name = authView.nameTx.text ?? ""
        let idnum = authView.idTx.text ?? ""
        let time = authView.timeBtn.titleLabel?.text ?? ""
        let dict = ["stuff": time,
                    "sting": idnum,
                    "grand": "1",
                    "trace": "99",
                    "paralysed": name,
                    "bajada": "11",
                    "enthusiastic": enthusiastic]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/sexes", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    self.dismiss(animated: true) {
                        self.getAuthInfo()
                    }
                    BuyPointConfig.pointToPageWithModel(with: "3", kstime: selectTime, jstime: DeviceInfo.currentTimestamp)
                }
                ToastManagerConfig.showToastText(form: authView, message: success.circular ?? "")
                break
            case .failure(_):
                break
            }
        }
    }
    
    private func getAuthInfo() {
        ViewCycleManager.showLoading()
        let barricaded = self.model.value?.enlarged?.orifice ?? ""
        let dict = ["barricaded": barricaded, "vitaman": "c"]
        NetworkManager.multipartFormDataRequest(endpoint: "/surely/cordillera", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            ViewCycleManager.hideLoading()
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    if let model = success.net?.deadly {
                        self.isSuccess.accept(model.strength ?? 0)
                        let picUrl = model.sucking ?? ""
                        self.popImageView.kf.setImage(with: URL(string: picUrl), placeholder: UIImage(named: "pheoamigesi"))
                    }
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
}
