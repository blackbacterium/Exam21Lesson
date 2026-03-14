//
//  LicenseAgreementViewController.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 14.03.2026.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let label = UILabel()
    
    var textManager: TextManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        setupView()
    }

}
//MARK: - Setting View
private extension LicenseAgreementViewController {
    
    func setupView() {
        setupScrollView()
        setupContentView()
        setupLabel()
        setupLayout()
    }
}

//MARK: - Setting Subviews
private extension LicenseAgreementViewController {
    
    func setupScrollView() {
        scrollView.backgroundColor = .gray
        scrollView.addSubview(contentView)
    }
    
    func setupContentView() {
        contentView.backgroundColor = .white
        contentView.addSubview(label)
    }
    
    func setupLabel() {
        let title = textManager?.getTitle()
        let text = textManager?.getText()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .justified
        label.textColor = .black
        label.text = "\(title ?? "")\n\(text ?? "")"
    }
}

//MARK: - Setup Layout
private extension LicenseAgreementViewController {
    
    func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 3000),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
