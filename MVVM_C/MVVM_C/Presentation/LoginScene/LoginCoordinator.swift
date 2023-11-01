//
//  LoginCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func pushToMainTabController()
}

final class LoginCoordinator: Coordinator, LoginViewControllerDelegate,  DetailInfoCoordinatorDelegate {

    var delegate: LoginCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .login
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
    }
    
    //startDetailInfoViewController
    func startDetailInfoViewController() {
        let coordinator = DetailInfoCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    //LoginCoordinatorDelegate
    func pushToMainTabController() {
        print("LoginCoordinator - pushToMainTabController")
        childCoordinators = self.childCoordinators.filter { $0 !== self }
        delegate?.pushToMainTabController()
    }
    
    //LoginViewControllerDelegate - start
    func pushToDetailInfoViewController() {
        print("LoginCoordinator - pushToDetailInfoViewController")
        childCoordinators = self.childCoordinators.filter { $0 !== self }
        startDetailInfoViewController()
    }
    
    func dismissViewController() {
        print("LoginCoordinator - dismissViewController")
        childCoordinators = self.childCoordinators.filter { $0 !== self }
//        navigationController.popViewController(animated: true)
        delegate?.pushToMainTabController()
    }

}


