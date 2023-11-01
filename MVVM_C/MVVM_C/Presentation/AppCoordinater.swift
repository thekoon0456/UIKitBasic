//
//  AppCoordinater.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

//뷰컨 만드는건 start
//pushToAViewController
//popViewController
//presentAViewController
//dismissViewController

final class AppCoordinator: BaseCoordinator, LoginCoordinatorDelegate, MainTabBarCoordinatorDelegate {
    
    override func start() {
        startMainTabController() //메인 뷰로 시작
    }
    
    func startMainTabController() {
        let coordinator = MainTabBarCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start() //뷰컨 생성 후 이동
        childCoordinators.append(coordinator)
    }
    
    //ParentCoordinator에서 childCoordinator 생성
    func startLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.delegate = self
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    //MainTabBarCoordinatorDelegate
    func pushToLoginViewController() {
        startLoginViewController()
    }
    
    //LoginCoordinatorDelegate
    func pushToMainTabController() {
        startMainTabController()
    }
    
//    // MARK: - Pop
//
//    func popViewController() {
//        navigationController.popViewController(animated: true)
////        childCoordinators.removeLast()
//    }
//    
//    
//    // MARK: - Dismiss
//    
//    func dismissViewController() {
//        navigationController.dismiss(animated: true)
//        childCoordinators.removeLast()
//    }
}
