//
//  HomeTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol HomeTabCoordinatorDelegate {
    
}

final class HomeTabCoordinator: Coordinator {
    
    var delegate: MainTabBarCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    var type: CoordinatorType = .Home
    
    func start() {
        let controller = HomeViewController()
        controller.viewModel = HomeTabViewModel()
        controller.delegate = self
        navigationController.viewControllers = [controller]
    }
}
