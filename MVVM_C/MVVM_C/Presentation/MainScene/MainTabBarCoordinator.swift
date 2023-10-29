//
//  Main.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {
    func didLoggedOut(_ coordinator: MainTabBarCoordinator)
}

final class MainTabBarCoordinator: CoordinatorProtocol, MainTabBarControllerDelegate {
    
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .main
    var delegate: MainTabBarCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("MainCoordinator 해제")
    }
    
    func start() {
        let mainTabBarController = MainTapBarController()
        mainTabBarController.tabBardelegate = self //delegate 채택
        
        navigationController.viewControllers = [mainTabBarController] //현재뷰컨 mainTabBarController로
    }
    
    //로그인했으면 AppCoordinagor로 알려야함
    func logout() {
        delegate?.didLoggedOut(self) //coordinator self로 보냄
    }
    
    //탭바 3개 만들기
    //Home
    //map
    //Info
}
