//
//  CustomView.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 23.05.2026.
//

import UIKit

class CustomView: UIView {
    
    var action: (() -> ())?
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let imageTea = UIImageView()
    private let checkButton = UIButton()
    private var toggleCheckMark = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = UIColor(
                cgColor: CGColor(red: 153/255, green: 255/255, blue: 153/255, alpha: 1)
            )
            self.layer.shadowOffset = CGSize(width: 2, height: 2)
        } completion: { _ in
            self.backgroundColor = UIColor(
                cgColor: CGColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)
            )
            self.layer.shadowOffset = CGSize(width: 5, height: 5)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(tea: TeaModel) {
        titleLabel.text = tea.nameTea
        descriptionLabel.text = tea.description
        imageTea.image = UIImage(named: tea.nameTea)
        toggleCheckMark = tea.isMark
        
        let checkMark = toggleCheckMark ? "checkmark.square.fill" : "checkmark.square"
        checkButton.setImage(UIImage(systemName: checkMark), for: .normal)
    }
    
    @objc
    private func deleteCheckMark() {
        toggleCheckMark.toggle()
        let checkMark = toggleCheckMark ? "checkmark.square.fill" : "checkmark.square"
        checkButton.setImage(UIImage(systemName: checkMark), for: .normal)
        
        action?()
    }
}


// MARK: - Setting
private extension CustomView {
    func setup() {
        backgroundColor = UIColor(cgColor: CGColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1))
        layer.cornerRadius = 20
                
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
        
        addSubViews()
        setupTitleLabel()
        setupDescription()
        setupImageTea()
        setupCheckButton()
        
        setupLayout()
    }
    
    func addSubViews() {
        [titleLabel,
         descriptionLabel,
         imageTea,
         checkButton].forEach { view in
            addSubview(view)
        }
    }
}

// MARK: - Settings Views
private extension CustomView {
    func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
    }

    func setupDescription() {
        descriptionLabel.numberOfLines = 0
    }

    func setupImageTea() {
        imageTea.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageTea.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageTea.contentMode = .scaleAspectFill
    }
    
    func setupCheckButton() {
        checkButton.tintColor = .systemCyan
        
        checkButton.addTarget(self,
                              action: #selector(deleteCheckMark),
                              for: .touchUpInside)
    }
}

// MARK: - Layout
private extension CustomView {
func setupLayout() {
    [titleLabel,
     descriptionLabel,
     imageTea,
     checkButton].forEach { view in
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let constraint = descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
    constraint.priority = .defaultLow
    
    NSLayoutConstraint.activate([
        imageTea.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        imageTea.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        
        titleLabel.leadingAnchor.constraint(equalTo: imageTea.trailingAnchor, constant: 16),
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkButton.leadingAnchor, constant: -8),
        
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        constraint,
        
        checkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        checkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        checkButton.widthAnchor.constraint(equalToConstant: 24),
        checkButton.heightAnchor.constraint(equalToConstant: 24)
    ])
}
}

