//
//  MapViewModel.swift
//  harley
//
//  Created by Emmanuel Zambrano on 13/02/25.
//

import SwiftUI
import MapKit
import CoreLocation

final class MapViewModel: NSObject, ObservableObject {
    @Published var locations: [Location] = []
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        setUpLocationManager()
    }
    
    private func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getLocations() {
        locations = [
            Location(title: "chicó", coordinates: CLLocationCoordinate2D(latitude: 4.6752628, longitude: -74.0488999))
        ]
    }
}

extension MapViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async { [weak self] in
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            self?.locations.append(contentsOf: [Location(title: "Me",
                                                        coordinates: CLLocationCoordinate2D(latitude: latitude,
                                                                                            longitude: longitude))])
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
}
