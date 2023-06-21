//
//  TabBarCoordinator.swift
//  TabBarCoordinator
//
//  Created by Tsvetan Tsvetanov on 21.06.23.
//

import UIKit

final class TabBarCoordinator {

    private let tabBarController: UITabBarController
    private weak var rootCoordinating: RootCoordinating?

    private var mapCoordinator: MapCoordinator?
    private var homeCoordinator: HomeCoordinator?
    private var settingsCoordinator: SettingsCoordinator?

    init(
        tabBarController: UITabBarController,
        rootCoordinating: RootCoordinating?
    ) {
        self.tabBarController = tabBarController
        self.rootCoordinating = rootCoordinating
    }

    func start() {

        tabBarController.tabBar.unselectedItemTintColor = .white

        let homeNavController = UINavigationController()
        homeNavController.tabBarItem.title = "Home"
        homeNavController.tabBarItem.image = UIImage(systemName: "house")
        let homeCoordinator = HomeCoordinator(navigationController: homeNavController)
        self.homeCoordinator = homeCoordinator
        homeCoordinator.start()

        let mapNavController = UINavigationController()
        mapNavController.tabBarItem.title = "Mao"
        mapNavController.tabBarItem.image = UIImage(systemName: "globe.europe.africa")
        let mapCoordinator = MapCoordinator(navigationController: mapNavController)
        self.mapCoordinator = mapCoordinator
        mapCoordinator.start()

        let settingsNavController = UINavigationController()
        settingsNavController.tabBarItem.title = "Settings"
        settingsNavController.tabBarItem.image = UIImage(systemName: "gearshape")
        let settingsCoordinator = SettingsCoordinator(navigationController: settingsNavController)
        self.settingsCoordinator = settingsCoordinator
        settingsCoordinator.start()

        tabBarController.setViewControllers(
            [homeNavController, mapNavController, settingsNavController],
            animated: true
        )
    }
}
