//
//  UIView+Subviews.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 30.12.2025.
//

import UIKit

extension UIView {
    func addMoreSubviews(_ subviews: UIView...) {
        for subview in subviews {
            addSubview(subview)
        }
    }
}
