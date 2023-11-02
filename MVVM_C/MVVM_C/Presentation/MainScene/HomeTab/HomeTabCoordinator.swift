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
    
    var delegate: HomeTabCoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .Home
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let controller = HomeViewController()
//        controller.viewModel = HomeTabViewModel()
//        controller.HomeTabCoordinator = self
//        navigationController.viewControllers = [controller]
    }
    
    deinit {
        print("HomeTabCoordinator 해제")
    }
    
    
}
