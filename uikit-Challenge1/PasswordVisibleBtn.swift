//
//  PasswordVisibleBtn.swift
//  uikit-Challenge1
//
//  Created by 안주환 on 2023/01/23.
//

import Foundation
import UIKit

class PasswordVisibleBtn : UIButton {
    
    let visibleImage = UIImage(named: "visiblePassword")?.withRenderingMode(.alwaysOriginal)
    let invisibleImage = UIImage(named: "invisible")?.withRenderingMode(.alwaysOriginal)
    
    var isPasswordVisible: Bool = false {
        didSet{
            self.setImage(isPasswordVisible ? invisibleImage : visibleImage, for: .normal)
        }
    }
}

