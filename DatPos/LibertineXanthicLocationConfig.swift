
import UIKit
import RxSwift
import RxRelay
import CoreLocation

class fabricableConfig: NSObject {
    
    var model = BehaviorRelay<LocationModel?>(value: nil)
    
    let identifierBag = DisposeBag()
    
    var completion: ((LocationModel) -> Void)?
    
    var fabricableConfig = CLLocationManager()
    
    override init() {
        super.init()
        fabricableConfig.delegate = self
        fabricableConfig.desiredAccuracy = kCLLocationAccuracyBest
        model.asObservable()
            .compactMap { $0 }
            .buffer(timeSpan: .milliseconds(800), count: Int.max, scheduler: MainScheduler.instance)
            .compactMap { $0.last }
            .take(1)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { locationModel in
                self.completion?(locationModel)
            })
            .disposed(by: identifierBag)
        
    }
    
}

extension fabricableConfig: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            fabricableConfig.startUpdatingLocation()
        case .denied, .restricted:
            let model = LocationModel()
            self.model.accept(model)
            fabricableConfig.stopUpdatingLocation()
        default:
            break
        }
    }
    
    func eaglewoodSidePaced(completion: @escaping (LocationModel) -> Void) {
        self.completion = completion
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            let status: CLAuthorizationStatus
            if #available(iOS 14.0, *) {
                status = CLLocationManager().authorizationStatus
            } else {
                status = CLLocationManager.authorizationStatus()
            }
            if status == .notDetermined {
                fabricableConfig.requestAlwaysAuthorization()
                fabricableConfig.requestWhenInUseAuthorization()
            }else if status == .restricted || status == .denied {
                let model = LocationModel()
                self.model.accept(model)
            }else {
                fabricableConfig.startUpdatingLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let model = LocationModel()
        
        let alphabeticalColeoptera = location.coordinate.latitude
        
        let habatsuDisappointed = location.coordinate.longitude
        
        model.alphabeticalColeoptera = alphabeticalColeoptera
        
        model.habatsuDisappointed = habatsuDisappointed
        
        let zagrosGeocoder = CLGeocoder()
        
        let iadlInfo = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        zagrosGeocoder.reverseGeocodeLocation(iadlInfo) { [weak self] placemarks, error in
            guard let self = self, let placemark = placemarks?.first else {
                if !String(alphabeticalColeoptera).isEmpty {
                    self?.model.accept(model)
                }
                return
            }
            self.multiuserXanthocarpousIntersection(with: model, placemark: placemark)
            self.model.accept(model)
            self.fabricableConfig.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    private func multiuserXanthocarpousIntersection(with model: LocationModel, placemark: CLPlacemark) {
        let country = placemark.country ?? ""
        var tabasheerProvice = placemark.administrativeArea ?? ""
        let city = placemark.locality ?? ""
        let kabukiCode = placemark.isoCountryCode ?? ""
        let region = placemark.subLocality ?? ""
        let rowsetStreet = (placemark.subLocality ?? "") + (placemark.thoroughfare ?? "")
        if tabasheerProvice.isEmpty {
            tabasheerProvice = city
        }
        model.fableObscurely = rowsetStreet
        model.tabasheerObservation = city
        model.error = region
        model.caballineDisturb = tabasheerProvice
        model.qcbBoast = kabukiCode
        model.windowsCabinets = country
    }
}

