//
//  MapTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol MaptabCoordinatorDelegate {
    
}

final class MapTabCoordinator: Coordinator, MapViewControllerDelegate {
    
    var delegate: MaptabCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = MapViewController()
        controller.viewModel = MapViewModel()
        controller.delegate = self
        navigationController.viewControllers = [controller]
    }
}
