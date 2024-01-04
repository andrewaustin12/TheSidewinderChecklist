//
//  LocationManager.swift
//  theSidewinderChecklist
//
//  Created by andrew austin on 12/31/23.
//

//import Foundation
//import CoreLocation
//
//class LocationManager: NSObject, ObservableObject {
//    
//    @Published var currentLocation: CLLocation?
//    private let locationManager = CLLocationManager()
//    
//    override init() {
//        super.init()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.distanceFilter = kCLDistanceFilterNone
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
//        locationManager.delegate = self
//    }
//}
//
//extension LocationManager: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last, currentLocation == nil else { return }
//        
//        DispatchQueue.main.async {
//            self.currentLocation = location
//        }
//    }
//}

//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    
//    var locationManager = CLLocationManager()
//    @Published var authorisationStatus: CLAuthorizationStatus?
//    
//    var latitude: Double {
//        locationManager.location?.coordinate.latitude ?? 37.322998
//    }
//    
//    var longitude: Double {
//        locationManager.location?.coordinate.longitude ?? -122.032181
//    }
//    
//    override init(){
//        super.init()
//        locationManager.delegate = self
//    }
//    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//        case .authorizedWhenInUse:
//            /// Location Services are available
//            authorisationStatus = .authorizedWhenInUse
//            locationManager.requestLocation()
//            break
//            
//        case .restricted:
//            authorisationStatus = .restricted
//            break
//            
//        case .denied:
//            authorisationStatus = .denied
//            break
//            
//        case .notDetermined:
//            authorisationStatus = .notDetermined
//            manager.requestWhenInUseAuthorization()
//            break
//        
//        default:
//            break
//        }
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("\(error.localizedDescription)")
//    }
//}
