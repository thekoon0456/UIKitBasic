//
//  InfoTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol InfoTabCoordinatorDelegate {
    
}

final class InfoTabCoordinator: Coordinator, InfoViewControllerDelegate {
    
    var delegate: MaptabCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = InfoViewController()
        viewController.delegate = self
//        navigationController.pushViewController(infoViewController, animated: true)
        navigationController.viewControllers = [viewController]
    }
}
