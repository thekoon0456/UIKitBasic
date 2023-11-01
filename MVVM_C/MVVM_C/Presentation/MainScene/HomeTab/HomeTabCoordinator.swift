//
//  HomeTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

final class HomeTabCoordinator: CoordinatorProtocol {
    
    weak var mainTabBarCoordinator: MainTabBarCoordinator?
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .Home
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = HomeViewController()
        controller.HomeTabCoordinator = self
        navigationController.viewControllers = [controller]
    }
    
    
}
