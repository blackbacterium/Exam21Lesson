//
//  ViewController.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 20.12.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let imageTea = ShadowView(imageName: NameTea.tea_1.rawValue)
    private let lastButton = CustomButton(textButton: "Last", bgColor: .blue)
    private let nextButton = CustomButton(textButton: "Next", bgColor: .white)
    private let firstButton = CustomButton(textButton: "First", bgColor: .red)
    private let teaDataManager = TeaDataManager(teas: TeaManager.getTeas())
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLabel()
        lastButton.setupShadow()
        nextButton.setupShadow()
        nextButton.setTitleColor(.black, for: .normal)
        setupStackView()
        view.addMoreSubviews(stackView, lastButton, nextButton, firstButton)
        addAction()
        
        setupLayout()
    }
    
    @objc
    private func NextButtonTapped() {
        let nextTea = teaDataManager.getNextTea()
        textLabel.text = nextTea.description
        imageTea.updateImage(imageName: nextTea.nameTea)
    }
}

// MARK: - Setup View
private extension ViewController {
    
    func addAction() {
        let actionLastButton = UIAction { _ in
            let lastValue = self.teaDataManager.getLastTea()
            self.textLabel.text = lastValue.description
            self.imageTea.updateImage(imageName: lastValue.nameTea)
        }
        
        lastButton.addAction(actionLastButton, for: .touchUpInside)
        
        nextButton.addTarget(
            self,
            action: #selector(NextButtonTapped),
            for: .touchUpInside)
        
        let actionFirstButton = UIAction { _ in
            let FirstValue = self.teaDataManager.getFirstTea()
            self.textLabel.text = FirstValue.description
            self.imageTea.updateImage(imageName: FirstValue.nameTea)
        }
        
        firstButton.addAction(actionFirstButton, for: .touchUpInside)
    }
    
    func setupLabel() {
        textLabel.text = DescriptionTeas.tea_1.rawValue
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.font = .systemFont(ofSize: 14, weight: .medium)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addMoreArrangedSubviews(imageTea, textLabel)
    }
}

//MARK: - Setup Layout
    private extension ViewController {
        
        func setupLayout() {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            lastButton.translatesAutoresizingMaskIntoConstraints = false
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            firstButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
                
                imageTea.heightAnchor.constraint(equalTo: stackView.widthAnchor),
                
                lastButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
                lastButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
                nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
                nextButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
                
                firstButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 100),
                firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
    }
