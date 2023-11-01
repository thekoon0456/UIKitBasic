//
//  LoginCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func pushToMainTabController()
}

final class LoginCoordinator: BaseCoordinator, LoginViewControllerDelegate,  DetailInfoCoordinatorDelegate {

    weak var delegate: LoginCoordinatorDelegate?
    var type: CoordinatorType = .login
    
    override func start() {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
        navigationController.viewControllers = [loginViewController]
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
        startDetailInfoViewController()
    }
    
    func dismissViewController() {
        print("LoginCoordinator - dismissViewController")
//        navigationController.popViewController(animated: true)
        childCoordinators = self.childCoordinators.filter { $0 !== self }
        delegate?.pushToMainTabController()
    }

}


