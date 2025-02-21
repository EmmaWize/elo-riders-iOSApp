//
//  UserInfoStruct.swift
//  harley
//
//  Created by Emmanuel Zambrano on 17/02/25.
//

import Foundation

struct UserInfo: Codable {
    var name: String?
    var mail: String?
    var elo: Double?
}

class storedUserInfo {
    private init() {}
    static var share = storedUserInfo()
    var userInfo = UserInfo()
    
    func setName(name: String) {
        userInfo.name = name
    }
    
    func setMail(mail: String) {
        userInfo.mail = mail
    }
    
    func setElo(elo: Double) {
        userInfo.elo = elo
    }
}
