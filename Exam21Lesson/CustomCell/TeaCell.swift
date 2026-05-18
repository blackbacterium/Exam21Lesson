//
//  TeaCell.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 11.05.2026.
//

import UIKit

class TeaCell: UITableViewCell {
    
    var action: (() -> ())?
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private let imageTea = UIImageView()
    private let checkButton = UIButton()
    private var toggleCheckMark = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
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
    func deleteCheckMark() {
        toggleCheckMark.toggle()
        let checkMark = toggleCheckMark ? "checkmark.square.fill" : "checkmark.square"
        checkButton.setImage(UIImage(systemName: checkMark), for: .normal)
        
        action?()
    }
}


// MARK: - Setting
private extension TeaCell {
    func setup() {
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
            contentView.addSubview(view)
        }
    }
}

// MARK: - Settings Views
private extension TeaCell {
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
private extension TeaCell {
func setupLayout() {
    [titleLabel,
     descriptionLabel,
     imageTea,
     checkButton].forEach { view in
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
        imageTea.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        imageTea.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        
        titleLabel.leadingAnchor.constraint(equalTo: imageTea.trailingAnchor, constant: 16),
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkButton.leadingAnchor, constant: -8),
        
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        
        checkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        checkButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        checkButton.widthAnchor.constraint(equalToConstant: 24),
        checkButton.heightAnchor.constraint(equalToConstant: 24)
    ])
}
}
