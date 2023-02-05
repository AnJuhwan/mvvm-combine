//
//  String+Ext.swift
//  uikit-Challenge1
//
//  Created by Jeff Jeong on 2023/02/04.
//

import Foundation

extension String {
    /// 이메일형식 validation 체크
    /// - Parameter email: emailTextField
    /// - Returns: 이메일형식이 맞으면 true , 아니면 false
    var isEmailValid : Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        var emailFormat = emailTest.evaluate(with: self)
        if(!emailFormat && self != "") {
            return false
        }
        return true
    }
}


