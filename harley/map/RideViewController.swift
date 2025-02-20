//
//  RideViewController.swift
//  harley
//
//  Created by Emmanuel Zambrano on 14/02/25.
//

import SwiftUI
import MapKit

struct RideViewController: View {
    var body: some View {
        ZStack {
            mapView()
            VStack {
                TopSerachBar()
                Spacer()
                HStack() {
                    ZStack {
                        Rectangle().foregroundColor(.black)
                        HStack {
                            HStack {
                                Spacer()
                                NavigationLink(destination: CreateRideViewController()) {
                                    iconTextView(title: "CREATE RIDE",
                                                 image: .map2,
                                                 textSize: 17)
                                }
                                Spacer()
                                iconTextView(title: "RECORD RIDE",
                                             image: .record,
                                             textSize: 17)
                                Spacer()
                            }
                        }.frame(height: 75)
                    }
                }.frame(height: 80)
            }
        }
    }
}

#Preview {
    RideViewController()
}
