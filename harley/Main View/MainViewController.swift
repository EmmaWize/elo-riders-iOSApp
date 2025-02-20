//
//  ContentView.swift
//  harley
//
//  Created by Emmanuel Zambrano on 12/02/25.
//

import SwiftUI

enum selectedView: String {
    case Home
    case Profile
    case Ride
    case Challenges
    case More
}

struct MainViewController: View {
    @State var selectedView: selectedView = .Home
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                switch selectedView {
                case .Home:
                    homeTab()
                case .Profile:
//                    Profile()
                        LogInView()
                    
                case .Ride:
                    RideViewController()
                case .Challenges:
                    Challenge()
                        .padding(.bottom, 21)
                case .More:
                    Rectangle()
                        .foregroundColor(.black)
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                    HStack {
                        TabBarItem(image: .harley, title: "Home", selectedView: selectedView)
                            .onTapGesture {
                                self.selectedView = .Home
                            }
                        Spacer()
                        TabBarItem(image: .helment, title: "Profile", selectedView: selectedView)
                            .onTapGesture {
                                selectedView = .Profile
                            }
                        Spacer()
                        TabBarItem(image: .map, title: "Ride", selectedView: selectedView)
                            .onTapGesture {
                                selectedView = .Ride
                            }
                        Spacer()
                        TabBarItem(image: .chalenge, title: "Challenges", selectedView: selectedView)
                            .onTapGesture {
                                selectedView = .Challenges
                            }
                        Spacer()
                        TabBarItem(systemImage: "ellipsis", title: "More", selectedView: selectedView)
                            .onTapGesture {
                                selectedView = .More
                            }
                    }
                    .foregroundColor(.blue)
                    .padding(.horizontal, 20)
                    
                }.frame(height: 85)
            }.ignoresSafeArea(.container, edges: .bottom)
        }
    }
}

#Preview {
    MainViewController()
}
