//
//  RootCoordinator.swift
//  TabBarCoordinator
//
//  Created by Tsvetan Tsvetanov on 21.06.23.
//

import UIKit

protocol RootCoordinating: AnyObject {
    func didSignIn()
    func didSignOut()
}

final class RootCoordinator {

    private let window: UIWindow
    private let isAuthenticated: Bool

    private var tabBarCoordinator: TabBarCoordinator?
    private var authCoordinator: AuthCoordinator?

    init(window: UIWindow, isAuthenticated: Bool = false) {
        self.window = window
        self.isAuthenticated = isAuthenticated
    }

    func start() {
        if isAuthenticated {
            showMain()
        } else {
            showAuth()
        }

        window.makeKeyAndVisible()
    }

    func showMain() {
        let tabBarController = UITabBarController()
        let tabBarCoordinator = TabBarCoordinator(tabBarController: tabBarController, rootCoordinating: self)

        window.rootViewController = tabBarController
        self.tabBarCoordinator = tabBarCoordinator
        tabBarCoordinator.start()
    }

    func showAuth() {
        let navigationController = UINavigationController()
        let authCoordinator = AuthCoordinator(navigationController: navigationController, rootCoordinating: self)

        window.rootViewController = navigationController
        self.authCoordinator = authCoordinator
        authCoordinator.start()
    }
}

extension RootCoordinator: RootCoordinating {

    func didSignIn() {
        showMain()
    }

    func didSignOut() {
        showAuth()
    }
}
