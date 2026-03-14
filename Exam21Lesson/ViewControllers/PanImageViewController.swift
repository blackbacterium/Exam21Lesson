//
//  PanImageViewController.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 01.03.2026.
//

import UIKit

class PanImageViewController: UIViewController {
    
    private let image = ShadowView(imageName: "Би Ло Чунь")
    
    private var panGestureRecognizer = UIPanGestureRecognizer()
    private var panGestureAnchorPoint: CGPoint?
    
    private var topAnchorConstraint: NSLayoutConstraint!
    private var centerXConstraint: NSLayoutConstraint!
    
//    var teaDataManager: ITeaDataManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        view.addSubview(image)
        
        setupLayout()
        setupGestureRecognizers()
    }
    
    @objc
    func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard panGestureRecognizer === gestureRecognizer else {
            return
        }
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint = panGestureAnchorPoint else { return }
            
            let gesturePoint = gestureRecognizer.location(in: view)
            
            centerXConstraint.constant += gesturePoint.x - panGestureAnchorPoint.x
            topAnchorConstraint.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
        case .cancelled, .ended:
            panGestureAnchorPoint = nil
        case .failed, .possible:
            break
        @unknown default:
            break
        }
    }
    
    private func setupGestureRecognizers() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
        
        image.addGestureRecognizer(panGestureRecognizer)
    }
}


// MARK: - Layout
private extension PanImageViewController {
    func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = image.widthAnchor.constraint(
            equalToConstant: Constants.initialImageDimSize
        )
        let heightConstraint = image.heightAnchor.constraint(
            equalToConstant: Constants.initialImageDimSize
        )
        
        centerXConstraint = image.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        topAnchorConstraint = image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        
        NSLayoutConstraint.activate([
            widthConstraint,
            heightConstraint,
            centerXConstraint,
            topAnchorConstraint
        ])
    }
}

private extension PanImageViewController {
    enum Constants {
        static let initialImageDimSize = 150.0
    }
}
