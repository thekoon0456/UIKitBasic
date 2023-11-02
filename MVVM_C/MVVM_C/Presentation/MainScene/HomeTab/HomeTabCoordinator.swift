//
//  HomeTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol HomeTabCoordinatorDelegate {
    
}

final class HomeTabCoordinator: BaseCoordinator {
    
    var delegate: HomeTabCoordinatorDelegate?
    
    var type: CoordinatorType = .Home
    
    override func start() {
//        let controller = HomeViewController()
//        controller.viewModel = HomeTabViewModel()
//        controller.HomeTabCoordinator = self
//        navigationController.viewControllers = [controller]
    }
    
    deinit {
        print("HomeTabCoordinator 해제")
    }
    
    
}
