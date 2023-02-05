//
//  LoginViewModel.swift
//  uikit-Challenge1
//
//  Created by 안주환 on 2023/02/04.
//

import Foundation
import Combine

class LoginViewModel: NSObject, ObservableObject {
    
    @Published var emailInput: String = ""
    
    lazy var emailValidInfoStringPublisher : AnyPublisher<String?, Never> = $emailInput
        .map{ $0.isEmailValid } // Bool
        .map{ $0 == false ? "이메일 형식으로 입력해주세요." : "" }
        .eraseToAnyPublisher()

    
    var emailValidInfoStringSubject : CurrentValueSubject = CurrentValueSubject<String?, Never>("")
    
    var subscriptions = Set<AnyCancellable>()
    
    var passwordInput: String = "" {
        didSet {
            print(#fileID, #function, #line, "- ")
            let isEnabled = isBtnEnableHandler(emailInput, passwordInput)
            isBtnEnabledChangeEvent?(isEnabled)
        }
    }
    
    // 액션 이벤트
    var isBtnEnabledChangeEvent: ((_ isEnabled: Bool) -> Void)? = nil
    
    // 이메일 유효 여부 이벤트
    var isEmailValidEvent: ((_ isValid: Bool) -> Void)? = nil
    
    override init() {
        super.init()
        print(#fileID, #function, #line, "- ")
    }
    
    
    /// 버튼 이메일 패스워드 잘 입력됐는지 확인해서 enable 시켜줌
    /// - Parameters:
    ///   - email:emailTextField
    ///   - password: passwordTextField
    /// - Returns: 이메일형식이 맞고, 패스워드가 있으면 true , 아니면  false
    fileprivate func isBtnEnableHandler(_ email:String, _ password:String) -> Bool {
        let isEmail = email.isEmailValid && email != "" ? true : false
        let isPassword = password != "" ? true : false
        
        if(isEmail && isPassword) {
            return true
        }
        return false
    }
}
