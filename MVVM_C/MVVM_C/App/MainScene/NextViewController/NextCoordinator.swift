//
//  NextCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/26/23.
//

import UIKit

protocol NextCoordinatorDelegate: AnyObject {
    func buttonTapped()
}

final class NaxtCoordinator: Coordinator, NextViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    weak var delegate: NextCoordinatorDelegate?
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = NextViewController()
        viewController.delegate = self
        
        navigationController.viewControllers = [viewController]
    }
    
    func nextVC() {
        delegate?.buttonTapped()
    }
    
}
