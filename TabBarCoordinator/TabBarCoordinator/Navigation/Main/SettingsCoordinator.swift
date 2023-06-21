//
//  SettingsCoordinator.swift
//  TabBarCoordinator
//
//  Created by Tsvetan Tsvetanov on 21.06.23.
//

import UIKit

final class SettingsCoordinator {

    let navigationController: UINavigationController

    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    func start() {
        let button = ViewControllerButton(title: "Show General") { [weak self] in
            self?.showGeneral()
        }

        let viewController = ViewController(
            title: "Settings",
            color: .gray,
            buttons: [button]
        )

        navigationController.setViewControllers([viewController], animated: true)
    }

    func showGeneral() {
        let generalViewController = ViewController(
            title: "General",
            color: .systemBlue,
            buttons: []
        )

        navigationController.pushViewController(generalViewController, animated: true)
    }
}
