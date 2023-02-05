//
//  ViewController.swift
//  uikit-Challenge1
//
//  Created by 안주환 on 2023/01/07.
//

import UIKit
import Combine

class TextFieldEventHandler: NSObject, UITextFieldDelegate {
    
    override init() {
        super.init()
    }
}

class ChallengeViewController: UIViewController {
    
    var loginViewModel =  LoginViewModel()
    
    var subscriptions = Set<AnyCancellable>()
    var isPasswordVisible = CurrentValueSubject<Bool, Never>(true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
        validationEmailLabel.text = ""
        
        // 1.
        self.emailTextField.addTarget(self, action: #selector(emailInputChanged(_:)), for: .editingChanged)
        
        self.passwordTextField.addTarget(self, action: #selector(passwordInputChanged(_:)), for: .editingChanged)
        
        super.hideKeyboard()
    
        passwordVisibilityBtn.addTarget(self, action: #selector(onSetPasswordVisibleBtnClick(_:)), for: .touchUpInside)
        
        self.isPasswordVisible.assign(to: \.isPasswordVisible, on: self.passwordVisibilityBtn).store(in: &subscriptions)
        
        self.isPasswordVisible.assign(to: \.isSecureTextEntry, on:self.passwordTextField).store(in: &subscriptions)
        
        // 4
        self.loginViewModel.isBtnEnabledChangeEvent = { [weak self] isEnabled in
            guard let self = self else { return }
            // 5
            DispatchQueue.main.async {
                self.loginButton.isEnabled = isEnabled
            }
        }
        
        self.loginViewModel
            .emailValidInfoStringPublisher
            .assign(to: \.text, on: self.validationEmailLabel)
            .store(in: &subscriptions)
            }
    
    @objc func passwordInputChanged(_ sender: UITextField) {
        print(#fileID, #function, #line, "- sender.text: \(sender.text)")
        if let userPasswordInput : String = sender.text {
            self.loginViewModel.passwordInput = userPasswordInput
        }
    }
    
    @objc func emailInputChanged(_ sender: UITextField) {
        print(#fileID, #function, #line, "- sender.text: \(sender.text)")
        if let userEmailInput : String = sender.text {
            // 2
            self.loginViewModel.emailInput = userEmailInput
        }
    }
    
    @IBOutlet var myScrollView: UIScrollView!
    @IBOutlet var validationEmailLabel: UILabel!
    @IBOutlet var passwordVisibilityBtn: PasswordVisibleBtn!
    @IBOutlet var backContainer: CustomView!
    @IBOutlet var emailTextField : CustomTextField!
    @IBOutlet var passwordTextField : CustomTextField!
    @IBOutlet var loginButton : CustomButton!
    @IBOutlet var facebookBtn : CustomButton!
    @IBOutlet var googleBtn : CustomButton!
    @IBOutlet var appleBtn : CustomButton!
    
    @objc fileprivate func onSetPasswordVisibleBtnClick(_ sender: UIButton!) {
        self.isPasswordVisible.send(!self.isPasswordVisible.value)
    }
}
