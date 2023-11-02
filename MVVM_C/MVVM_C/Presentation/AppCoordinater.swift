//
//  AppCoordinater.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

//isLoggedIn이 false면 login, true면 main뷰로
//모든 Coordinator는 CoordinatorProtocol 채택 (명세)
final class AppCoordinator: BaseCoordinator, LoginCoordinatorDelegate, MainTabBarCoordinatorDelegate {

    var isLoggedIn = false
    
    override func start() {
        if isLoggedIn {

            showMainTabController() //메인 뷰
            childCoordinators = childCoordinators.filter { $0 !== self }
            print("AppCoordinator - showMainTabController() - \(childCoordinators)")
        } else {

            showLoginViewController() //온보딩 뷰
            childCoordinators = childCoordinators.filter { $0 !== self }
            print("AppCoordinator -showLoginViewController() - \(childCoordinators)")
        }
    }
    //start() 내부 코드, coordinator 생성, start로 viewcontroller와 viewModel 생성, 주입
    func showMainTabController() {
        let coordinator = MainTabBarCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start() //뷰컨 생성 후 이동
        childCoordinators.append(coordinator)
    }
    
    //ParentCoordinator에서 childCoordinator 생성
    func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func showLoginView() {
        showLoginViewController()
    }
    
    // MARK: - Pop
    
    func popViewController() {
        navigationController.popViewController(animated: true)
//        childCoordinators.removeLast()
    }
    
    
    // MARK: - Dismiss
    
    func dismissViewController() {
        navigationController.dismiss(animated: true)
        childCoordinators.removeLast()
    }
}
