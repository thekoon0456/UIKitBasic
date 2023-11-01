//
//  DetailInfoInputCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import UIKit

protocol DetailInfoCoordinatorDelegate {
    func dismissViewController()
}

final class DetailInfoCoordinator: Coordinator, DetailInfoViewControllerDelegate {

    var delegate: DetailInfoCoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("DetailInfoCoordinator - start")
        let viewController = DetailInfoViewController()
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
//        navigationController.pushViewController(viewController, animated: true)
    }
    
    func dismissViewController() {
        childCoordinators = self.childCoordinators.filter { $0 !== self }
        delegate?.dismissViewController()
    }
}
