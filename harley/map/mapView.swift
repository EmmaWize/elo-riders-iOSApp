//
//  mapView.swift
//  harley
//
//  Created by Emmanuel Zambrano on 13/02/25.
//

import SwiftUI
import MapKit

struct mapView: View {
    @StateObject var viewModel = MapViewModel()
    @State var position: MapCameraPosition = .automatic
    @State var selectedItem: MKMapItem?
    var body: some View {
        Map(position: $position, selection: $selectedItem) {
            ForEach(viewModel.locations, id: \.self) { location in
                Annotation(location.title, coordinate: location.coordinates) {
                    mapItem()
                }
                
            }
        }
    }
}

#Preview {
    mapView()
}
