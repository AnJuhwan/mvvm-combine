//
//  UIViewController+Ext.swift
//  uikit-Challenge1
//
//  Created by 안주환 on 2023/01/28.
//

import UIKit

extension UIViewController {
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
