//
//  UIStackView+Subviews.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 30.12.2025.
//

import UIKit

extension UIStackView {
    func addMoreArrangedSubviews(_ subviews: UIView...) {
        for subview in subviews {
            addArrangedSubview(subview)
        }
    }
}
