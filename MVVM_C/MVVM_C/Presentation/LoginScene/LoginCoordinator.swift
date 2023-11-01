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

final class LoginCoordinator: BaseCoordinator, LoginViewControllerDelegate, DetailInfoCoordinatorDelegate {

    //제일 처음 AppCoordinator 받는 곳은 weak var X
    var delegate: LoginCoordinatorDelegate?

    var type: CoordinatorType = .login
    
    //makeLoginViewControllerPage
    override func start() {
        let loginviewController = LoginViewController()
        loginviewController.view.backgroundColor = .cyan
        loginviewController.delegate = self //loginviewController delegate 채택
        loginviewController.modalPresentationStyle = .fullScreen
        navigationController.present(loginviewController, animated: true)
//        navigationController.viewControllers = [loginviewController]
    }
    
    func startDetailInfoViewController() {
        let coordinator = DetailInfoCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    //LoginCoordinatorDelegate
    func pushToMainTabController() {
        delegate?.pushToMainTabController()
    }
    
    //LoginViewControllerDelegate
    func pushToDetailInfoViewController() {
        startDetailInfoViewController()
    }
    
    func popViewController() {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }

}


