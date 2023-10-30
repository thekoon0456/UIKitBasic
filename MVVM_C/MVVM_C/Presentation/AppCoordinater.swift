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

    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    //로그인 여부에 따라 뷰 다르게
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //첫 시작시 화면
    func start() { //뷰컨트롤러 생성, 뷰컨트롤러의 coordinator로 self 할당, 네비 컨트롤러에 push, 
        if isLoggedIn {
            showMainTabController() //메인 뷰
        } else {
            showLoginViewController() //온보딩 뷰
        }
    }
    
    //start() 내부 코드, coordinator 생성, start로 viewcontroller와 viewModel 생성, 주입
    func showMainTabController() {
        let mainTabBarCoordinator = MainTabBarCoordinator(navigationController: navigationController)
        mainTabBarCoordinator.parentCoordinator = self
        mainTabBarCoordinator.start() //뷰컨 생성 후 이동
        childCoordinators.append(mainTabBarCoordinator)
    }
    //ParentCoordinator에서 childCoordinator 생성
    func showLoginViewController() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.parentsCoordinator = self
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
}

//LoginCoordinatorDelegate
extension AppCoordinator: LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: CoordinatorProtocol) {
        print("didLoggedIn")
        removeFromChildCoordinators(coordinator: coordinator)
        showMainTabController() //로그인 했으니 메인 뷰로
    }
}

//MainCoordinatorDelegate
extension AppCoordinator: MainTabBarCoordinatorDelegate {
    func didLoggedOut(_ coordinator: CoordinatorProtocol) {
        print("didLoggedOut")
        removeFromChildCoordinators(coordinator: coordinator)
        showLoginViewController() //로그아웃했으니 로그인뷰로
    }
}
