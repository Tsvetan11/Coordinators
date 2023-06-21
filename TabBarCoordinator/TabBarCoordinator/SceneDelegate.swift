//
//  SceneDelegate.swift
//  TabBarCoordinator
//
//  Created by Tsvetan Tsvetanov on 21.06.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootCoordinator: RootCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let appWindow = UIWindow(windowScene: windowScene)
        self.window = appWindow

        let coordinator = RootCoordinator(window: appWindow)
        self.rootCoordinator = coordinator

        rootCoordinator?.start()
    }
}

