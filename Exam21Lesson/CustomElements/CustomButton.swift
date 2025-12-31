//
//  CustomButton.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 28.12.2025.
//

import UIKit

class CustomButton: UIButton {
    init(textButton: String, bgColor: UIColor) {
        super.init(frame: .zero)
        setupButton(text: textButton, bdColor: bgColor)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(rect: bounds)
        layer.shadowPath = shadowPath.cgPath
    }
}

// MARK: - Setup View
extension CustomButton {
    private func setupButton(text: String, bdColor: UIColor) {
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = bdColor
        layer.cornerRadius = Constant.cornerRadius
        
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 8, height: 8)
        layer.shadowRadius = 10
    }
}

// MARK: - Constants
private extension CustomButton {
    enum Constant {
        static let cornerRadius: CGFloat = 10
    }
}
