//
//  AppCoordinater.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

//isLoggedIn이 false면 login, true면 main뷰로
//모든 Coordinator는 CoordinatorProtocol 채택 (명세)
final class AppCoordinator: CoordinatorProtocol {

    //공통
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    //로그인 여부에 따라 뷰 다르게
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController,
         type: CoordinatorType) {
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
    
    func popCurrentPage() {
        <#code#>
    }
    
    func showMainViewController() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
    
    func showLoginViewController() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }
}
