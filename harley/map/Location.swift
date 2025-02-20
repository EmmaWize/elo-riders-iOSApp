//
//  Location.swift
//  harley
//
//  Created by Emmanuel Zambrano on 14/02/25.
//

import UIKit
import MapKit

struct Location: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let coordinates: CLLocationCoordinate2D
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.coordinates.latitude == rhs.coordinates.latitude &&
        lhs.coordinates.longitude == rhs.coordinates.longitude
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(coordinates.latitude)
        hasher.combine(coordinates.longitude)
    }
}
