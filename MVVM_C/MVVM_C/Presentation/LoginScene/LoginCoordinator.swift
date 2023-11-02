//
//  LoginCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginCoordinatorDelegate {
    func showMainTabController()
//    func popViewController()
}

final class LoginCoordinator: BaseCoordinator, LoginViewControllerDelegate, DetailInfoInputViewControllerDelegate, DetailInfoInputCoordinatorDelegate {

    //제일 처음 AppCoordinator 받는 곳은 weak var X
    var delegate: LoginCoordinatorDelegate?

    var type: CoordinatorType = .login
    
    //makeLoginViewControllerPage
    override func start() {
        let loginviewController = LoginViewController()
        loginviewController.view.backgroundColor = .cyan
        loginviewController.delegate = self //loginviewController delegate 채택
        navigationController.viewControllers = [loginviewController]
    }
    
    func showDetailInfoInput() {
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.delegate = self
        navigationController.pushViewController(detailInfoInputViewController, animated: true)
    }
    
    func showMainTabController() {
        delegate?.showMainTabController()
    }
    
    func moveToMainTab() {
        childCoordinators = childCoordinators.filter { $0 !== self }
        print("LoginCoordinator \(childCoordinators)")
        delegate?.showMainTabController()
    }
    
}


