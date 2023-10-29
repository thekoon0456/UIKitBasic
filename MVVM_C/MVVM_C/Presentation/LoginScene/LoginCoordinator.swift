//
//  LoginCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

//위로 전달해줄 메서드, 여기서는 메인뷰로 이동
protocol LoginCoordinatorDelegate: AnyObject {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}

final class LoginCoordinator: CoordinatorProtocol {
    
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .login
    var delegate: LoginCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //makeLoginViewControllerPage
        let loginviewController = LoginViewController()
        loginviewController.view.backgroundColor = .cyan
        loginviewController.delegate = self //loginviewController delegate 채택
        navigationController.viewControllers = [loginviewController]
    }
    
    //로그인 성공시, DetailInfoInput화면으로 이동
    func showDetailInfoInput() {
        let detailInfoInputCoordinator = DetailInfoInputCoordinator(navigationController: navigationController)
        detailInfoInputCoordinator.delegate = self
        detailInfoInputCoordinator.start()
        childCoordinators.append(detailInfoInputCoordinator)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    //위로 전달
    func login() {
        delegate?.didLoggedIn(self)
    }
    
    //아래로 들어가기
    func goToDetail() {
        showDetailInfoInput()
    }
}
