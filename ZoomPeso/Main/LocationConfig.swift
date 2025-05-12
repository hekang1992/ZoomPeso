//
//  LocationConfig.swift
//  ZoomPeso
//
//  Created by Quaker on 2025/4/21.
//

import UIKit
import RxSwift
import RxRelay
import CoreLocation

class LocationModel {
    var disturb: String?
    var boast: String?
    var coleoptera: Double?
    var cabinets: String?
    var obscurely: String?
    var disappointed: Double?
    var observation: String?
    var error: String?
}

class LocationConfig: NSObject {
    
    var completion: ((LocationModel) -> Void)?
    
    var model = BehaviorRelay<LocationModel?>(value: nil)
    
    let disposeBag = DisposeBag()
    
    var locationConfig = CLLocationManager()
    
    override init() {
        super.init()
        locationConfig.delegate = self
        locationConfig.desiredAccuracy = kCLLocationAccuracyBest
        model.asObservable()
            .debounce(RxTimeInterval.milliseconds(500),
                       scheduler: MainScheduler.instance)
           .subscribe(onNext: { locationModel in
                if let locationModel = locationModel {
                    self.completion?(locationModel)
                }
            }).disposed(by: disposeBag)
        
    }
    
}

extension LocationConfig: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            locationConfig.startUpdatingLocation()
        case .denied, .restricted:
            let model = LocationModel()
            self.model.accept(model)
            locationConfig.stopUpdatingLocation()
        default:
            break
        }
    }
    
    func getLocationInfo(completion: @escaping (LocationModel) -> Void) {
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
                locationConfig.requestAlwaysAuthorization()
                locationConfig.requestWhenInUseAuthorization()
            }else if status == .restricted || status == .denied {
                let model = LocationModel()
                self.model.accept(model)
            }else {
                locationConfig.startUpdatingLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let model = LocationModel()
        model.coleoptera = location.coordinate.latitude
        model.disappointed = location.coordinate.longitude
        let geocoder = CLGeocoder()
        let locationInfo = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        geocoder.reverseGeocodeLocation(locationInfo) { [weak self] placemarks, error in
            guard let self = self, let placemark = placemarks?.first else {
                let latitude = String(location.coordinate.latitude)
                if !latitude.isEmpty {
                    self?.model.accept(model)
                }
                return
            }
            self.locationToModel(model, with: placemark)
            self.model.accept(model)
            self.locationConfig.stopUpdatingLocation()
        }
    }

    private func locationToModel(_ model: LocationModel, with placemark: CLPlacemark) {
        let countryCode = placemark.isoCountryCode ?? ""
        let country = placemark.country ?? ""
        var provice = placemark.administrativeArea ?? ""
        let city = placemark.locality ?? ""
        let region = placemark.subLocality ?? ""
        let street = (placemark.subLocality ?? "") + (placemark.thoroughfare ?? "")
        if provice.isEmpty {
            provice = city
        }
        model.disturb = provice
        model.boast = countryCode
        model.cabinets = country
        model.obscurely = street
        model.observation = city
        model.error = region
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
}

