//
//  CustomView.swift
//  uikit-Challenge1
//
//  Created by 안주환 on 2023/01/07.
//

import Foundation
import UIKit

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth;
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor;
        }
    }
    
    @IBInspectable
    var borderRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = borderRadius;
        }
    }
}
