//
//  LogInViewModel.swift
//  harley
//
//  Created by Emmanuel Zambrano on 17/02/25.
//

import SwiftUI

class LogInViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var showingSheet: Bool = false
    var isFormValid: Bool {
        return !password.isEmpty && !userName.isEmpty
    }
    
    func validatePassword() {
        if !isFormValid {
            return
        }
        fetchItems()
        showingSheet.toggle()
    }
    
    func fetchItems() {
        guard let url = URL(string: "https://run.mocky.io/v3/8e2d8d29-f2ec-40d3-a3d1-63dfd0ecfcb7") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decodedItems = try JSONDecoder().decode(UserInfo.self, from: data)
                DispatchQueue.main.async {
                    storedUserInfo.share.setMail(mail: decodedItems.mail ?? "")
                    storedUserInfo.share.setName(name: decodedItems.name ?? "")
                    storedUserInfo.share.setElo(elo: decodedItems.elo ?? 0.0)
                }
            } catch {
                print("Decoding error:", error)
            }
        }.resume()
    }
}
