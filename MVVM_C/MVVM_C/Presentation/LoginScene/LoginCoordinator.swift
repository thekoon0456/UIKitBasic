//
//  LoginCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didLoggedIn(_ coordinator: LoginCoordinator)
    func removeFromChildCoordinators(coordinator: CoordinatorProtocol)
}

final class LoginCoordinator: CoordinatorProtocol, LoginViewControllerDelegate {

    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .login
    var delegate: LoginCoordinatorDelegate? //weak하니까 안댄다..
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //makeLoginViewControllerPage
        let loginviewController = LoginViewController()
        loginviewController.view.backgroundColor = .cyan
        loginviewController.delegate = self //loginviewController delegate 채택
//        navigationController.pushViewController(loginviewController, animated: true)
        navigationController.viewControllers = [loginviewController]
    }
    
    //로그인했으면 AppCoordinagor로 childCoordinator를  전달.
    func login() {
        print("LoginCoordinator, login")
        delegate?.didLoggedIn(self)
    }
}
