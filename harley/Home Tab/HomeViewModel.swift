//
//  HomeViewModel.swift
//  harley
//
//  Created by Emmanuel Zambrano on 13/02/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var items: [mainItem] = []
    let userName = storedUserInfo.share.userInfo.name ?? ""

    init() {
        loadEvents()
    }

    func loadEvents() {
        items = [mainItem(image: .bike1, description: "View Event Details", elo: 50),
                 mainItem(image: .bike2, description: "View Event Details", elo: 10),
                 mainItem(image: .bike2, description: "View Event Details", elo: 10)
        ]
    }
}
