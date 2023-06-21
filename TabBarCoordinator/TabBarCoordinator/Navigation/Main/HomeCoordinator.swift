//
//  HomeCoordinator.swift
//  TabBarCoordinator
//
//  Created by Tsvetan Tsvetanov on 21.06.23.
//

import UIKit

final class HomeCoordinator {

    let navigationController: UINavigationController

    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    func start() {
        let button = ViewControllerButton(title: "Detail") { [weak self] in
            self?.showDetail()
        }

        let viewController = ViewController(
            title: "Home",
            color: .systemPink,
            buttons: [button]
        )

        navigationController.setViewControllers([viewController], animated: true)
    }

    func showDetail() {
        let detailViewController = ViewController(
            title: "Detail",
            color: .brown,
            buttons: []
        )

        navigationController.pushViewController(detailViewController, animated: true)
    }
}
