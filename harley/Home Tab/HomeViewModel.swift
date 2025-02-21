//
//  HomeViewModel.swift
//  harley
//
//  Created by Emmanuel Zambrano on 13/02/25.
//

import SwiftUI

struct mainItemResponce: Codable {
    let image: String
    let description: String
    let elo: Double
}

class HomeViewModel: ObservableObject {
    @Published var items: [mainItem] = []
    let userName = storedUserInfo.share.userInfo.name ?? ""
    
    init() {
        loadEvents()
    }
    
    private func sortByProximity(to target: Double, items: [mainItem]) -> [mainItem] {
        return items.sorted { abs($0.elo - target) < abs($1.elo - target) }
    }
    
    private func loadEvents() {
        getMainItems()
    }
    
    private func getMainItems() {
        let url = "https://run.mocky.io/v3/73684304-970f-4eee-8c79-9236f771c47d"
        NetworkManager.fetchData(from: url) { [weak self] (result: Result<[mainItemResponce], Error>) in
            switch result {
            case .success(let homeItems):
                self?.setItems(homeItems: homeItems)
            case .failure(let error):
                print("Error fetching user info:", error)
            }
        }
    }
    
    private func setItems(homeItems: ([mainItemResponce])) {
        DispatchQueue.main.async {
            let items = homeItems.compactMap{ mainItem.from(response: $0) }
            self.items = self.sortByProximity(to: storedUserInfo.share.userInfo.elo ?? 0.0, items: items)
        }
    }
    
    private func transformImage(imageString: String) -> ImageResource {
        if "bike1" == imageString {
            return .bike1
        } else {
            return .bike2
        }
    }
}

extension mainItem {
    static func from(response: mainItemResponce) -> mainItem {
        var imageResource: ImageResource = .bike1
        if response.image == "bike1" {
            imageResource = .bike1
        } else {
            imageResource = .bike2
        }
        return mainItem(image: imageResource, description: response.description, elo: response.elo)
    }
}
