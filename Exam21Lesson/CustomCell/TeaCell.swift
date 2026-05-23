//
//  TeaCell.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 11.05.2026.
//

import UIKit

class TeaCell: UITableViewCell {
    
    var action: (() -> ())?
    
    private let customView = CustomView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .darkGray
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(tea: TeaModel) {
        customView.configure(tea: tea)
        customView.action = action
    }
    
    @objc
    private func deleteCheckMark() {
        
    }
}


// MARK: - Setting
private extension TeaCell {
    func setup() {
        contentView.addSubview(customView)
        setupLayout()
    }
}

// MARK: - Layout
private extension TeaCell {
    func setupLayout() {
        customView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        customView.topAnchor.constraint(equalTo: contentView.topAnchor),
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
    ])
}
}
