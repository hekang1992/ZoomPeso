//
//  LocationManagerConfig.swift
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

class LocationManagerConfig: NSObject {
    
    
    var model = BehaviorRelay<LocationModel?>(value: nil)
    
    let disposeBag = DisposeBag()
    
    var completion: ((LocationModel) -> Void)?
    
    var LocationManagerConfig = CLLocationManager()
    
    override init() {
        super.init()
        LocationManagerConfig.delegate = self
        LocationManagerConfig.desiredAccuracy = kCLLocationAccuracyBest
        model.asObservable()
            .compactMap { $0 }
            .buffer(timeSpan: .milliseconds(800), count: Int.max, scheduler: MainScheduler.instance)
            .compactMap { $0.last }
            .take(1)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { locationModel in
                self.completion?(locationModel)
            })
            .disposed(by: disposeBag)
        
    }
    
}

extension LocationManagerConfig: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            LocationManagerConfig.startUpdatingLocation()
        case .denied, .restricted:
            let model = LocationModel()
            self.model.accept(model)
            LocationManagerConfig.stopUpdatingLocation()
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
                LocationManagerConfig.requestAlwaysAuthorization()
                LocationManagerConfig.requestWhenInUseAuthorization()
            }else if status == .restricted || status == .denied {
                let model = LocationModel()
                self.model.accept(model)
            }else {
                LocationManagerConfig.startUpdatingLocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let model = LocationModel()
        
        let coleoptera = location.coordinate.latitude
        
        let disappointed = location.coordinate.longitude
        
        model.coleoptera = coleoptera
        
        model.disappointed = disappointed
        
        let geocoder = CLGeocoder()
        
        let locationInfo = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        geocoder.reverseGeocodeLocation(locationInfo) { [weak self] placemarks, error in
            guard let self = self, let placemark = placemarks?.first else {
                return
            }
            self.locationToModel(with: model, placemark: placemark)
            self.model.accept(model)
            self.LocationManagerConfig.stopUpdatingLocation()
        }
    }

    private func locationToModel(with model: LocationModel, placemark: CLPlacemark) {
        let country = placemark.country ?? ""
        var provice = placemark.administrativeArea ?? ""
        let city = placemark.locality ?? ""
        let countryCode = placemark.isoCountryCode ?? ""
        let region = placemark.subLocality ?? ""
        let street = (placemark.subLocality ?? "") + (placemark.thoroughfare ?? "")
        if provice.isEmpty {
            provice = city
        }
        model.obscurely = street
        model.observation = city
        model.error = region
        model.disturb = provice
        model.boast = countryCode
        model.cabinets = country
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
}

