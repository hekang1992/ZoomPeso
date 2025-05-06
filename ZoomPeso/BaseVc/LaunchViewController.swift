//
//  LaunchViewController.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import SnapKit
import Network
import AppTrackingTransparency
import AdSupport
import NetworkExtension

let SHOWGUIDE: String = ""
class LaunchViewController: BaseViewController {
    
    var buttons: [UIButton] = []
    
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    let images = ["Higimageone", "Higimagetwo", "Higimagethree"]
    
    var show: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let show = UserDefaults.standard.object(forKey: SHOWGUIDE) as? String ?? ""
        self.show = show
        if show != "1" {
            firstVcInfo()
        }
        
        NetworkMonitor.shared.startMonitoring { [weak self] grand in
            if grand {
                self?.resetLoginIngo()
                if show != "1" {
                    self?.idfainfo()
                }
            }
        }
        
    }
    
}

extension LaunchViewController: UIScrollViewDelegate {
    
    func idfainfo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if #available(iOS 14.0, *) {
                ATTrackingManager.requestTrackingAuthorization { status in
                    switch status {
                    case .restricted:
                        break
                    case .authorized, .notDetermined, .denied:
                        self.apiIdfaInfo()
                        break
                    @unknown default:
                        break
                    }
                }
            }
        }
    }
    
    func resetLoginIngo() {
        let constructed = DeviceInfo.getCurrentLanguage()
        let similarly = checkProxySettings()
        let segment = isVPNConnected()
        let dict = ["constructed": constructed,
                    "similarly": similarly,
                    "segment": segment,
                    "relationShip": "1"]
        let man = NetworkRequstManager()
        man.multipartFormDataRequest(endpoint: "/surely/constructed", parameters: dict, responseType: BaseModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                guard let self = self else { return }
                if success.wedge == "0" {
                    if let model = success.net {
                        DataLoginManager.shared.currentModel = model
                    }
                }
                if show == "1" {
                    notiRootManager()
                }
                break
            case .failure(_):
                break
            }
        }
    }
    
    func checkProxySettings() -> String {
        guard let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
              let httpProxy = settings["HTTPProxy"] as? String,
              !httpProxy.isEmpty else {
            return "0"
        }
        return "1"
    }
    
    func isVPNConnected() -> String {
        let manager = NEVPNManager.shared()
        var isConnected = false
        let semaphore = DispatchSemaphore(value: 0)
        manager.loadFromPreferences { error in
            if error == nil {
                isConnected = (manager.connection.status == .connected)
            }
            semaphore.signal()
        }
        _ = semaphore.wait(timeout: .now() + 1)
        return isConnected ? "1" : "0"
    }
    
    private func firstVcInfo() {
        setupScrollView()
        setupPages()
    }
    
    func setupScrollView() {
        scrollView.frame = view.bounds
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(images.count), height: view.frame.height)
        view.addSubview(scrollView)
    }
    
    func setupPages() {
        for i in 0..<images.count {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i) * view.frame.width,
                                                      y: 0,
                                                      width: view.frame.width,
                                                      height: view.frame.height))
            imageView.image = UIImage(named: images[i])
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            scrollView.addSubview(imageView)
            
            let button = UIButton(type: .custom)
            button.backgroundColor = UIColor.init(hexStr: "#FF3824")
            button.titleLabel?.font = UIFont(name: ArialBlackFont, size: 18)
            button.setTitle(i == images.count - 1 ? "Begin" : "Next", for: .normal)
            button.layer.cornerRadius = 23.5
            button.tag = i
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            imageView.addSubview(button)
            
            button.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.size.equalTo(CGSize(width: 237, height: 47))
                make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            }
            
            buttons.append(button)
        }
    }
    
    func setupPageControl() {
        view.addSubview(pageControl)
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.centerX.equalToSuperview()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(round(scrollView.contentOffset.x / view.frame.width))
        pageControl.currentPage = page
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender.tag < images.count - 1 {
            let nextOffset = CGPoint(x: CGFloat(sender.tag + 1) * view.frame.width, y: 0)
            scrollView.setContentOffset(nextOffset, animated: true)
        } else {
            // Begin tapped on last page
            goToMainApp()
        }
    }
    
    func goToMainApp() {
        UserDefaults.standard.set("1", forKey: SHOWGUIDE)
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: CHANGE_ROOT_VC), object: nil)
    }
    
}
