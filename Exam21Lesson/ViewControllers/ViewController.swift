//
//  ViewController.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 20.12.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let imageTea = ShadowView()
    private let nameLabel = UILabel()
    
    private let lastButton = CustomButton(textButton: "Last", bgColor: .systemTeal)
    private let nextButton = CustomButton(textButton: "Next", bgColor: .white)
    private let firstButton = CustomButton(textButton: "First", bgColor: .red)
    
    private let stackView = UIStackView()
    
    var teaDataManager: ITeaDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastButton.delegate = self
        nextButton.delegate = self
        firstButton.delegate = self
        lastButton.nameInstance = "Кнопка - назад"
        nextButton.nameInstance = "Кнопка - вперед"
        firstButton.nameInstance = "Кнопка - возврат на начало"
        imageTea.nameInstance = "Название картинки"
        
        view.backgroundColor = .white
//        print(view.countUIButton(imageTea, lastButton, nextButton, firstButton))
//        view.printAllSubviews(imageTea, lastButton, nextButton, firstButton)
        
        imageTea.updateImage(imageName: teaDataManager?.getCurrentTea().nameTea ?? "")
        
        setupLabels()
        lastButton.setupShadow()
        nextButton.setupShadow()
        nextButton.setTitleColor(.black, for: .normal)
        setupStackView()
        view.addMoreSubviews(stackView, lastButton, nextButton, firstButton)
//        addAction()
        
        setupLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameLabel.text =  teaDataManager?.getCurrentTea().nameTea
        nameLabel.isHidden = false
    }
//    @objc
//    private func nextButtonTapped() {
//        let nextTea = teaDataManager?.getNextTea()
//        textLabel.text = nextTea?.teaDescription
//        imageTea.updateImage(imageName: nextTea?.nameTea ?? "")
//    }
}

// MARK: - Setup View
private extension ViewController {
    
//    func addAction() {
//        let actionLastButton = UIAction { _ in
//            let lastValue = self.teaDataManager?.getLastTea()
//            self.textLabel.text = lastValue?.teaDescription
//            self.imageTea.updateImage(imageName: lastValue?.nameTea ?? "")
//        }
//        
//        lastButton.addAction(actionLastButton, for: .touchUpInside)
//        
//        nextButton.addTarget(
//            self,
//            action: #selector(NextButtonTapped),
//            for: .touchUpInside)
//        
//        let actionFirstButton = UIAction { _ in
//            let FirstValue = self.teaDataManager?.getFirstTea()
//            self.textLabel.text = FirstValue?.teaDescription
//            self.imageTea.updateImage(imageName: FirstValue?.nameTea ?? "")
//        }
//        
//        firstButton.addAction(actionFirstButton, for: .touchUpInside)
//    }
    
    func setupLabels() {
        textLabel.text = teaDataManager?.getCurrentTea().teaDescription
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.font = .systemFont(ofSize: 14, weight: .medium)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        nameLabel.isHidden = true
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addMoreArrangedSubviews(imageTea, textLabel, nameLabel)
    }
}

//MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        let teaModel: TeaModel?
        
        if button == lastButton {
            teaModel = teaDataManager?.getLastTea()
        } else if button == nextButton {
            teaModel = teaDataManager?.getNextTea()
        } else {
            teaModel = teaDataManager?.getFirstTea()
        }
        textLabel.text = teaModel?.teaDescription
        imageTea.updateImage(imageName: teaModel?.nameTea ?? "")
        nameLabel.isHidden = true
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
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            imageTea.heightAnchor.constraint(equalTo: stackView.widthAnchor),
            
            lastButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            lastButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 60),
            nextButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            
            firstButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 80),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
