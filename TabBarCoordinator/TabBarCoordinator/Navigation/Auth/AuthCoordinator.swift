//
//  AuthCoordinator.swift
//  TabBarCoordinator
//
//  Created by Tsvetan Tsvetanov on 21.06.23.
//

import UIKit

final class AuthCoordinator {

    private let navigationController: UINavigationController
    private weak var rootCoordinating: RootCoordinating?

    init(
        navigationController: UINavigationController,
        rootCoordinating: RootCoordinating?
    ) {
        self.navigationController = navigationController
        self.rootCoordinating = rootCoordinating
    }

    func start() {
        showSignIn()
    }

    func showSignIn() {
        let showSignUpButton = ViewControllerButton(title: "Sign up") { [weak self] in
            self?.showSignUp()
        }

        let showMainButton = ViewControllerButton(title: "Main") { [weak self] in
            self?.showMain()
        }

        let signInViewController = ViewController(
            title: "Sign in",
            color: .cyan,
            buttons: [showSignUpButton, showMainButton]
        )

        navigationController.setViewControllers([signInViewController], animated: true)
    }

    func showSignUp() {
        let showSignInButton = ViewControllerButton(title: "Sign in") { [weak self] in
            self?.showSignIn()
        }

        let showMainButton = ViewControllerButton(title: "Main") { [weak self] in
            self?.showMain()
        }

        let signUpViewController = ViewController(
            title: "Sign up",
            color: .red,
            buttons: [showSignInButton, showMainButton]
        )

        navigationController.setViewControllers([signUpViewController], animated: true)
    }

    func showMain() {
        rootCoordinating?.didSignIn()
    }
}
