//
//  Login.swift
//  uikit-Challenge1
//
//  Created by 안주환 on 2023/01/31.
//

import Foundation

// MARK: - Login Model
struct Login {
    let email: String
    let password: String
    
    init(email:String = "", password:String = "") {
        self.email = email
        self.password = password
    }
}
