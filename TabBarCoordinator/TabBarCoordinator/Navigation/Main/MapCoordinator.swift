//
//  MapCoordinator.swift
//  TabBarCoordinator
//
//  Created by Tsvetan Tsvetanov on 21.06.23.
//

import UIKit

final class MapCoordinator {

    let navigationController: UINavigationController

    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    func start() {

        let button = ViewControllerButton(title: "Show Street") { [weak self] in
            self?.showStreet()
        }

        let viewController = ViewController(
            title: "Map",
            color: .green,
            buttons: [button]
        )

        navigationController.setViewControllers([viewController], animated: true)
    }

    func showStreet() {
        let streetViewController = ViewController(
            title: "Street",
            color: .orange,
            buttons: []
        )

        navigationController.pushViewController(streetViewController, animated: true)
    }
}
