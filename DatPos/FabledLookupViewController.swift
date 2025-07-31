
import UIKit
import SnapKit
import Network
import AdSupport
import NetworkExtension
import AppTrackingTransparency

let SHOWGUIDE: String = ""
let dyc = "https://ph4-dc.oss-ap-southeast-1.ali"
let cdc = "yuncs.com/zoom-peso/zpml.json"
class FabledLookupViewController: OaklandLibidoViewController {
    
    var cilButtons: [UIButton] = []
    
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    let images = ["CaballerNameHigimageone", "LiteralPicHigimagetwo", "LeftIconHigimagethree"]
    
    var show: String = ""
    
    var index: Int = 0
    
    var yacareArray: [[String: String]] = []
    
    lazy var dictionariesView: UIImageView = {
        let dictionariesView = UIImageView()
        dictionariesView.contentMode = .scaleAspectFill
        dictionariesView.image = UIImage(named: "sabayonRightLacunimge")
        return dictionariesView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let show = UserDefaults.standard.object(forKey: SHOWGUIDE) as? String ?? ""
        
        view.addSubview(dictionariesView)
        dictionariesView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.show = show
        
        NetworkMonitor.shared.startMonitoring { [weak self] haafGrand in
            if haafGrand {
                self?.zagrosNearestFraternite()
            }
        }
        
    }
    
    func zagrosNearestFraternite() {
        let planarityUrl = dyc + cdc
        guard let url = URL(string: planarityUrl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data else {
                return
            }
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                if let labeArray = jsonObject as? [[String: String]] {
                    
                    self.yacareArray = labeArray
                    ubangiWadableUser()
                }
            } catch {
                
            }
        }
        task.resume()
    }
    
    private func ubangiWadableUser() {
        self.fullIacuShared { haafGrand in
            if haafGrand {
                self.shapePartialSteiner()
            }else {
                if self.index > self.yacareArray.count - 1 {
                    return
                }
                let iacuUrl = self.yacareArray[self.index]["zpp"] ?? ""
                UserDefaults.standard.set(iacuUrl, forKey: "baseUrl")
                UserDefaults.standard.synchronize()
                self.index += 1
                self.ubangiWadableUser()
            }
        }
        
    }
    
}

extension FabledLookupViewController: UIScrollViewDelegate {
    
    func shapePartialSteiner() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if #available(iOS 14.0, *) {
                ATTrackingManager.requestTrackingAuthorization { status in
                    switch status {
                    case .restricted:
                        break
                    case .authorized, .notDetermined, .denied:
                        self.pdaCheckpointVee()
                        break
                    @unknown default:
                        break
                    }
                }
            }
        }
    }
    
    func fullIacuShared(complete: @escaping (Bool) -> Void) {
        let constructed = ServerSideDeviceInfo.exceptionIdentifierSdk()
        let similarly = hyperlinkSdkAccess()
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
                if ["0", "00"].contains(success.wedge) {
                    if let model = success.net {
                        DataLoginManager.shared.currentModel = model
                    }
                    if show != "1" {
                        windowsMiddleUba()
                    }else {
                        digitalGuiView()
                    }
                }
                complete(true)
                break
            case .failure(_):
                complete(false)
                break
            }
        }
    }
    
    func hyperlinkSdkAccess() -> String {
        guard let settings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
              let hardProxy = settings["HTTPProxy"] as? String,
              !hardProxy.isEmpty else {
            return "0"
        }
        return "1"
    }
    
    func isVPNConnected() -> String {
        let manager = NEVPNManager.shared()
        var jobConnected = false
        let pinvokeSemaphore = DispatchSemaphore(value: 0)
        manager.loadFromPreferences { error in
            if error == nil {
                jobConnected = (manager.connection.status == .connected)
            }
            pinvokeSemaphore.signal()
        }
        _ = pinvokeSemaphore.wait(timeout: .now() + 1)
        return jobConnected ? "1" : "0"
    }
    
    private func windowsMiddleUba() {
        oakleyZagazigOverhead()
        digestSabaIdle()
    }
    
    func oakleyZagazigOverhead() {
        scrollView.frame = view.bounds
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(images.count), height: SCREEN_HEIGHT)
        view.addSubview(scrollView)
    }
    
    func digestSabaIdle() {
        for i in 0..<images.count {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(i) * SCREEN_WIDTH,
                                                      y: 0,
                                                      width: SCREEN_WIDTH,
                                                      height: SCREEN_HEIGHT))
            imageView.image = UIImage(named: images[i])
            imageView.contentMode = .scaleAspectFill
            imageView.isUserInteractionEnabled = true
            scrollView.addSubview(imageView)
            
            let button = UIButton(type: .custom)
            button.backgroundColor = UIColor.init(cssStr: "#FF3825")
            button.titleLabel?.font = UIFont(name: kafFont, size: 18)
            button.setTitle(i == images.count - 1 ? "Begin" : "Next", for: .normal)
            button.layer.cornerRadius = 23.5
            button.tag = i
            button.addTarget(self, action: #selector(rabbinDacoitSabaean(_:)), for: .touchUpInside)
            imageView.addSubview(button)
            
            button.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.size.equalTo(CGSize(width: 237, height: 47))
                make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            }
            
            cilButtons.append(button)
        }
    }
    
    func xanthineMinkowskiOak() {
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
    
    @objc func rabbinDacoitSabaean(_ sender: UIButton) {
        if sender.tag < images.count - 1 {
            let fontOffset = CGPoint(x: CGFloat(sender.tag + 1) * view.frame.width, y: 0)
            scrollView.setContentOffset(fontOffset, animated: true)
        } else {
            fabianUatRegular()
        }
    }
    
    func fabianUatRegular() {
        UserDefaults.standard.set("1", forKey: SHOWGUIDE)
        UserDefaults.standard.synchronize()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: CHANGE_ROOT_VC), object: nil)
    }
    
}
