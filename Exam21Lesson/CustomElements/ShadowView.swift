//
//  ShadowView.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 26.12.2025.
//

import UIKit

class ShadowView: UIView {
    
    var nameInstance: String?
    
    private let imageView = UIImageView()
    
    init(imageName: String? = nil) {
        super.init(frame: .zero)
        setupView()
        setupImageView()
        setupLayout()
        
        if let imageName {
            updateImage(imageName: imageName)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup View
extension ShadowView {
    
    func updateImage(imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    private func setupImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        addSubview(imageView)
    }
    
    private func setupView() {
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
    }
}

//MARK: - Setup Layout
private extension ShadowView {
    
    func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
