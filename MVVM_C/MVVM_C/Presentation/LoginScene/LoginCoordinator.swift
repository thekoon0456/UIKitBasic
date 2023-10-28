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

final class LoginCoordinator: CoordinatorProtocol, LoginViewControllerDelegate, DetailInfoInputCoordinatorDelegate {
    
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .login
    var loginCoordinatorDelegate: LoginCoordinatorDelegate? //weak하니까 안댄다..
    var detailInfoInputCoordinatorDelegate: DetailInfoInputCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //makeLoginViewControllerPage
        let loginviewController = LoginViewController()
        loginviewController.view.backgroundColor = .cyan
        loginviewController.loginViewDelegate = self //loginviewController delegate 채택
//        navigationController.pushViewController(loginviewController, animated: true)
        navigationController.viewControllers = [loginviewController]
    }
    
    //로그인했으면 AppCoordinagor로 childCoordinator를  전달.
    func login() {
        print("LoginCoordinator, login")
        loginCoordinatorDelegate?.didLoggedIn(self)
    }
    //위로 올려야댐
    func exButtonDidTapped(_ coordinator: DetailInfoInputCoordinator) {
        print("exButtonDidTapped, login")
//        showDetailInfoInputController()
        detailInfoInputCoordinatorDelegate?.exButtonDidTapped(self)
        removeFromChildCoordinators(coordinator: coordinator)
    }
    
    //coordinator, 뷰컨 만듬
    func showDetailInfoInputController() {
        let coordinator = DetailInfoInputCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start() //여기서 뷰컨 만듬
        childCoordinators.append(coordinator)
    }
}
