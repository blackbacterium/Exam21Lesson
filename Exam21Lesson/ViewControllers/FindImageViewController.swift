//
//  FindImageViewController.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 22.02.2026.
//

import UIKit

class FindImageViewController: UIViewController {
    
    private let textLabel = UILabel()
    private let textField = UITextField()
    private let button = CustomButton(textButton: "Проверить", bgColor: .systemCyan)
    private let image = ShadowView()
    private let imageLabel = UILabel()
    
    private let stackView = UIStackView()
    
    var teaDataManager: ITeaDataManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        button.delegate = self
        
        view.backgroundColor = .white
        
        setupTextLabels()
        setupTextField()
        setupStackView()
        view.addMoreSubviews(textLabel, textField, button, stackView)
        
        setupLayout()
    }
    
    func afterTouch() {
        view.endEditing(true)
        guard let currentModel = teaDataManager?.getModelByImageName(textField.text ?? "") else {
            textLabel.text = "Такой картинки нет"
            textField.text = ""
            image.isHidden = true
            imageLabel.isHidden = true
            return
        }
        image.updateImage(imageName: currentModel.nameTea)
        imageLabel.text = currentModel.teaDescription
        textLabel.text = "Такая картинка есть"
        textField.text = ""
        image.isHidden = false
        imageLabel.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        afterTouch()
    }
}


// MARK: - setupView
private extension FindImageViewController {
    func setupTextField() {
        textField.placeholder = "Название картинки"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
    }
    
    func setupTextLabels() {
        textLabel.text = "Введите название картинки"
        textLabel.font = .systemFont(ofSize: 14, weight: .medium)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        
        imageLabel.numberOfLines = 0
        imageLabel.lineBreakMode = .byWordWrapping
        imageLabel.font = .systemFont(ofSize: 14, weight: .medium)
        imageLabel.textColor = .black
        imageLabel.textAlignment = .center
        imageLabel.isHidden = true
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 5
        image.isHidden = true
        
        stackView.addMoreArrangedSubviews(image, imageLabel)
    }
}

//MARK: - ICustomButtonDelegate
extension FindImageViewController: ICustomButtonDelegate {
    func pressedButton(_ button: UIButton) {
        afterTouch()
    }
}

// MARK: - UITextFieldDelegate
extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        afterTouch()
        return true
    }
}

// MARK: - setupLayout
private extension FindImageViewController {
    func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 70),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 40),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            image.heightAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}
