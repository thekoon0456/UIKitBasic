//
//  InfoTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

final class InfoTabCoordinator: CoordinatorProtocol {
    
    var appCoordinator: AppCoordinator?
    var mainTabBarCoordinator: MainTabBarCoordinator?
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let infoViewController = InfoViewController()
        infoViewController.infoTapCoordinator = self
        infoViewController.appCoordinator = appCoordinator
        infoViewController.mainTabBarCoordinator = mainTabBarCoordinator
        navigationController.viewControllers = [infoViewController]
    }
}
