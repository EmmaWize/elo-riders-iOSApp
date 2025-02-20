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
        // add some logic
        storedUserInfo.share.setMail(mail: userName)
        storedUserInfo.share.setName(name: "Emma")
        storedUserInfo.share.setElo(elo: 1.1)
        showingSheet.toggle()
    }
}
