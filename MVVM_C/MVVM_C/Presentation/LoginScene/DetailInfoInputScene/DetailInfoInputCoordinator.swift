//
//  DetailInfoInputCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/28/23.
//

import UIKit

protocol DetailInfoInputCoordinatorDelegate: AnyObject {
    func exButtonDidTapped(_ coordinator: DetailInfoInputCoordinator)
}

class DetailInfoInputCoordinator: CoordinatorProtocol, DetailInfoInputControllerDelegate {
    
    var childCoordinators: [CoordinatorProtocol] = []
    
    var navigationController: UINavigationController
    
    var type: CoordinatorType = .next
    
    var delegate: LoginCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.delegate = self
        navigationController.viewControllers = [detailInfoInputViewController]
    }
    
    func exButtonTap() {
        print("DEBUG: DetailInfoInputCoordinator의 exButtonTap 실행")
        delegate?.exButtonDidTapped(self)
    }
}
