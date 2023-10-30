//
//  InfoTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

final class InfoTabCoordinator: CoordinatorProtocol {
    var parentCoordinator: MainTabBarCoordinator?
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let infoViewController = InfoViewController()
        infoViewController.delegate = self
        navigationController.viewControllers = [infoViewController]
    }
}

extension InfoTabCoordinator: InfoViewControllerDelegate {
    func editButtonTapped() {
        parentCoordinator?.parentCoordinator?.start()
        print("editButtonTapped")
    }
    
    func settingButtonTapped() {
        parentCoordinator?.start()
        print("settingButtonTapped")
    }
}
