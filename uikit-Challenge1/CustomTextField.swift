//
//  CustomTextField.swift
//  uikit-Challenge1
//
//  Created by 안주환 on 2023/01/07.
//

import Foundation
import UIKit

@IBDesignable
class CustomTextField : UITextField {
    
    @IBInspectable
    var bgColor: UIColor = UIColor.clear {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable
    var borderRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = borderRadius;
        }
    }
    
    @IBInspectable
    var hasShadow : Bool = false {
        didSet {
            if hasShadow {
                layer.applyShadow()
            }
        }
    }
    
    @IBInspectable
    var paddingLeft : CGFloat = 16 {
        didSet {
            self.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: paddingLeft, height: 0.0))
            self.leftViewMode = .always
        }
    }
    
    
}

