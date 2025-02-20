//
//  CreateRideViewModel.swift
//  harley
//
//  Created by Emmanuel Zambrano on 19/02/25.
//

import MapKit
import _MapKit_SwiftUI
import Combine

struct friendLocation {
    let location: Location
    let elo: Double
}

final class CreateRideViewModel: NSObject, ObservableObject {
    var fullLocations: [friendLocation] = []
    @Published var locations: [friendLocation] = []
    @Published var location: String = ""
    @Published var position: MapCameraPosition = .automatic
    @Published var showPicker: Bool = false
    @Published var selectedOption = 0
    @Published var RodaType = 0
    private var cancellables = Set<AnyCancellable>()
    
    let options = ["Easy", "Medium", "Hard"]
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        setUpLocationManager()
        observeSelectedOption()
    }
    
    private func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func addFriendsTaped() {
        showPicker.toggle()
        getFriendsLocations()
    }
    
    func getFriendsLocations() {
        if locations.count > 1 {
            guard let myLocation = locations.first else {return}
            locations = [myLocation]
        } else {
            locations.append(contentsOf: [ friendLocation(location: Location(title: "David", coordinates: CLLocationCoordinate2D(latitude: 4.6752640,
                                                                                                                                 longitude: -74.0488979)),
                                                          elo: 30),
                                           friendLocation(location: Location(title: "Juan", coordinates: CLLocationCoordinate2D(latitude: 4.7130767,
                                                                                                                                longitude: -74.0338406)),
                                                          elo: 50),
                                           friendLocation(location: Location(title: "Gus", coordinates: CLLocationCoordinate2D(latitude: 4.7260686,
                                                                                                                               longitude: -74.0339068)),
                                                          elo: 70)
                                         ])
            fullLocations = locations
        }
    }
    
    private func observeSelectedOption() {
        $selectedOption
            .sink { [weak self] newValue in
                self?.optionChanged(to: newValue)
            }
            .store(in: &cancellables)
    }
    
    private func optionChanged(to newValue: Int) {
        var filterValue = 0.0
        if newValue == 0 {
            filterValue = 0
        } else if newValue == 1 {
            filterValue = 50
        } else if newValue == 2 {
            filterValue = 70
        }
        locations = fullLocations.filter({ item in
            item.location.title == storedUserInfo.share.userInfo.name ?? "" || item.elo >= filterValue
        })
    }
}

extension CreateRideViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async { [weak self] in
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let userName = storedUserInfo.share.userInfo.name ?? "Me"
            self?.locations.append(contentsOf: [friendLocation(location: Location(title: userName,
                                                                                  coordinates: CLLocationCoordinate2D(latitude: latitude,
                                                                                                                      longitude: longitude)), elo: 20)])
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
}

