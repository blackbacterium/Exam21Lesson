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

        let marTableViewController = MarTableViewController()
        marTableViewController.teaDataManager = buildTeaDataManager()

        window.rootViewController = marTableViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

extension SceneDelegate {
    func buildTeaDataManager() -> ITeaDataManager {
        let teaManager: ITeaManager = TeaManager()
        let teaDataManager: ITeaDataManager = TeaDataManager(
            teas: teaManager.getTeas().sorted(by: <)
        )
        return teaDataManager
    }
}
