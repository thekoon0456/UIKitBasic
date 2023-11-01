//
//  MapTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol MaptabCoordinatorDelegate {
    
}

final class MapTabCoordinator: BaseCoordinator, MapViewControllerDelegate {
    
    var delegate: MaptabCoordinatorDelegate?
    
    var type: CoordinatorType = .app
    
    override func start() {
        let controller = MapViewController()
        controller.viewModel = MapViewModel()
        controller.delegate = self
        navigationController.viewControllers = [controller]
    }
}
