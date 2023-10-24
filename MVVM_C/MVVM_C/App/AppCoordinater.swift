//
//  AppCoordinater.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

//isLoggedIn이 false면 login, true면 main뷰로
//LoginCoordinatorDelegate 채택
final class AppCoordinator: Coordinator, LoginCoordinatorDelegate, MainCoordinatorDelegate {
    
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController
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
    
    func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showMainViewController()
    }
    
    func didLoggedOut(_ coordinator: MainCoordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
        showLoginViewController()
    }
    
}
