//
//  LoginCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

final class LoginCoordinator: CoordinatorProtocol {
    //제일 처음 AppCoordinator 받는 곳은 weak var X
    var appCoordinator: AppCoordinator?
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .login
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //makeLoginViewControllerPage
    func start() {
        let loginviewController = LoginViewController()
        loginviewController.view.backgroundColor = .cyan
        loginviewController.loginCoordinator = self //loginviewController delegate 채택
        loginviewController.appCoordinator = appCoordinator
        navigationController.viewControllers = [loginviewController]
    }
    
    //로그인 성공시, DetailInfoInput화면으로 이동
    func showDetailInfoInput() {
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.loginCoordinator = self
        navigationController.pushViewController(detailInfoInputViewController, animated: true)
    }
}


