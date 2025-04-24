//
//  PermissionManager.swift
//  ZoomPeso
//
//  Created by 何康 on 2025/4/24.
//

import UIKit
import AVFoundation
import Photos

class PermissionManager {
    
    static let shared = PermissionManager()
    
    private init() {}
    
    func checkCameraPermission(completion: @escaping (Bool) -> Void) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .authorized:
            completion(true)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
        case .denied, .restricted:
            completion(false)
        @unknown default:
            completion(false)
        }
    }
    
    func checkPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized:
            completion(true)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                DispatchQueue.main.async {
                    completion(newStatus == .authorized)
                }
            }
        case .denied, .restricted:
            completion(false)
        case .limited:
            completion(true)
        @unknown default:
            completion(false)
        }
    }
    
}
