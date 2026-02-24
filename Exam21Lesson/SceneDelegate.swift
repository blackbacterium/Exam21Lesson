//
//  SceneDelegate.swift
//  Exam21Lesson
//
//  Created by Black Bacterium on 20.12.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let teaManager: ITeaManager = TeaManager()
        let sortedTeas = teaManager.getTeas().sorted(by: <)
        let teaDataManager = TeaDataManager(teas: sortedTeas)
//        let viewController = ViewController()
        let findImageViewController = FindImageViewController()
        findImageViewController.teaDataManager = teaDataManager
        
//        printTeas(sortedTeas)
        
        window.rootViewController = findImageViewController
        window.makeKeyAndVisible()
        self.window = window
        
    }
    
    private func printTeas(_ teas: [TeaModel]) {
        for tea in teas {
            print(tea)
            print("")
        }
    }
}

