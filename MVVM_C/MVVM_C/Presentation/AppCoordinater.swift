//
//  AppCoordinater.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

//isLoggedIn이 false면 login, true면 main뷰로
//모든 Coordinator는 CoordinatorProtocol 채택 (명세)
final class AppCoordinator: CoordinatorProtocol, LoginCoordinatorDelegate, MainCoordinatorDelegate {

    //공통
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    //로그인 여부에 따라 뷰 다르게
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //첫 시작시 화면
    func start() {
        if isLoggedIn {
            showMainViewController()
        } else {
            showLoginViewController()
        }
    }
    
    //start() 내부 코드, coordinator 생성, start로 viewcontroller와 viewModel 생성, 주입
    func showMainViewController() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.delegate = self
        mainCoordinator.start() //뷰컨 생성 후 이동
        childCoordinators.append(mainCoordinator)
    }
    
    func showLoginViewController() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.delegate = self
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
    
    //LoginCoordinatorDelegate
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        print("didLoggedIn")
        removeFromChildCoordinators(coordinator: coordinator)
        showMainViewController()
    }
    
    //MainCoordinatorDelegate
    func didLoggedOut(_ coordinator: MainCoordinator) {
        print("didLoggedOut")
        removeFromChildCoordinators(coordinator: coordinator)
        showLoginViewController()
    }
}
