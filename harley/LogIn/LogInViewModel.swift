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
        getUserInfo()
        showingSheet.toggle()
    }
    
    private func getUserInfo() {
        let url = "https://run.mocky.io/v3/8e2d8d29-f2ec-40d3-a3d1-63dfd0ecfcb7"
        NetworkManager.fetchData(from: url) { [weak self] (result: Result<UserInfo, Error>) in
            switch result {
            case .success(let userInfo):
                self?.setUSerData(userInfo: userInfo)
            case .failure(let error):
                print("Error fetching user info:", error)
            }
        }
    }
    
    func setUSerData(userInfo: UserInfo) {
        DispatchQueue.main.async {
            storedUserInfo.share.setMail(mail: userInfo.mail ?? "")
            storedUserInfo.share.setName(name: userInfo.name ?? "")
            storedUserInfo.share.setElo(elo: userInfo.elo ?? 0.0)
        }
    }
}
