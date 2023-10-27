//
//  LoginCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

final class LoginCoordinator: CoordinatorProtocol, LoginViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: LoginCoordinatorDelegate?
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .cyan
        viewController.delegate = self //delegate 채택
        
        navigationController.viewControllers = [viewController] //?
    }
    
    //로그인했으면 AppCoordinagor로 알려야함
    func login() {
        delegate?.didLoggedIn(self) //coordinator self로 보냄
    }
}
