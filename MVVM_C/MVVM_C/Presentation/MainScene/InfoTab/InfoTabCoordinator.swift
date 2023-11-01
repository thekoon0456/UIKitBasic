//
//  InfoTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol InfoTabCoordinatorDelegate {
    
}

final class InfoTabCoordinator: BaseCoordinator, InfoViewControllerDelegate {
    
    var delegate: InfoTabCoordinatorDelegate?

    var type: CoordinatorType = .app

    override func start() {
        let viewController = InfoViewController()
        viewController.delegate = self
//        navigationController.pushViewController(infoViewController, animated: true)
        navigationController.viewControllers = [viewController]
    }
}
