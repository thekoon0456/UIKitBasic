//
//  LoginCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func showMainTabView()
}

final class LoginCoordinator: Coordinator, LoginViewControllerDelegate,  DetailInfoCoordinatorDelegate {

    var delegate: LoginCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .login
    
    //makeLoginViewControllerPage
    override func start() {
        let loginviewController = LoginViewController()
        loginviewController.view.backgroundColor = .cyan
        loginviewController.delegate = self //loginviewController delegate 채택
        navigationController?.viewControllers = [loginviewController]
    }
    
    deinit {
        print("LoginCoordinator 해제")
    }
    
    func showDetailInfoInput() {
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.delegate = self
        navigationController?.pushViewController(detailInfoInputViewController, animated: true)
    }
    
    func showMainTabView() {
        removeFromChildCoordinators(coordinator: self)
        print("showMainTabView 실행됨, \(childCoordinators)")
        delegate?.showMainTabView()
    }
}


