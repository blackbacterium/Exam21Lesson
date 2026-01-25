//
//  UIView+print.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 25.01.2026.
//

import UIKit

extension UIView {
    func countUIButton(_ views: UIView...) -> Int {
        var amount = 0
        for view in views {
            if view is UIButton {
                amount += 1
            }
        }
        return amount
    }
    
    func printAllSubviews(_ views: UIView...) -> Void {
        for view in views {
            if let subview = view as? CustomButton {
                print(subview.nameInstance ?? "")
            } else if let subview = view as? ShadowView {
                print(subview.nameInstance ?? "")
            }
        }
    }
}
