//
//  CALayer+Ext.swift
//  uikit-Challenge1
//
//  Created by 안주환 on 2023/01/07.
//

import Foundation
import UIKit

extension CALayer {
    /// 뷰에 그림자 적용
    /// - Parameters:
    ///   - color: 그림자 색
    ///   - alpha: 그림자 투명도
    ///   - x: 가로위치
    ///   - y: 세로위치
    ///   - blur: 블러
    ///   - spread: 퍼짐정도
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.25,
        x: CGFloat = 0,
        y: CGFloat = 4,
        blur: CGFloat = 10,
        spread: CGFloat = 0)
    {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = 5
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    func point(inside point: CGPoint) -> Bool {
        let margin: CGFloat = 44
        let hitArea = self.bounds.insetBy(dx: -margin, dy: -margin)
        return hitArea.contains(point)
    }
}




