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
    
    var parentCoordinator: AppCoordinator? //순환참조 방지
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .main
    
    private var mainTabBarController: MainTapBarController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("MainCoordinator 해제")
    }
    
    func start() {
        //탭바 만들기
        showMainTabController()
    }
    
    //로그인했으면 AppCoordinagor로 알려야함
    func logout() {
        parentCoordinator?.didLoggedOut(self) //coordinator self로 보냄
    }
    
    //탭바 3개 만들기
    func showMainTabController() {
        //탭바 안이므로 각각 컨트롤러를 루트로 한 네비 컨트롤러 새로 생성
        let homeTableViewController = HomeViewController()
        let mapViewController = MapViewController()
        let infoViewController = InfoViewController()
        
        let homeNavigationController: UINavigationController = makeNavigationController(
            rootViewController: homeTableViewController,
            title: "Home",
            tabbarImage: "house",
            tag: 0
        )
        
        let mapNavigationController: UINavigationController = makeNavigationController(
            rootViewController: mapViewController,
            title: "Map",
            tabbarImage: "map",
            tag: 1
        )
        
        
        let infoNavigationController: UINavigationController = makeNavigationController(
            rootViewController: infoViewController,
            title: "Info",
            tabbarImage: "info.square",
            tag: 2
        )
        
        mainTabBarController = MainTapBarController(
            viewModel: MainViewModel(),
            pages: [homeNavigationController,
                    mapNavigationController,
                    infoNavigationController]
        )
        
        //coordinator 설정
        let homeTabCoordinator = HomeTabCoordinator(navigationController: homeNavigationController)
        let mapTabCoordinator = MapTabCoordinator(navigationController: mapNavigationController)
        let infoTabCoordinator = InfoTabCoordinator(navigationController: infoNavigationController)
        
        childCoordinators.append(homeTabCoordinator)
        childCoordinators.append(mapTabCoordinator)
        childCoordinators.append(infoTabCoordinator)
        
        homeTabCoordinator.parentCoordinator = self
        mapTabCoordinator.parentCoordinator = self
        infoTabCoordinator.parentCoordinator = self
        
        homeTabCoordinator.start()
        mapTabCoordinator.start()
        infoTabCoordinator.start()
        
        configureViewController()
    }
    
    func configureViewController() {
        mainTabBarController.tabBarDelegate = self
        navigationController.viewControllers = [mainTabBarController]
    }
    
    private func makeNavigationController(
        rootViewController rootVC: UIViewController,
        title: String,
        tabbarImage: String,
        tag: Int
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootVC)
        
        navigationController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: tabbarImage),
            tag: tag
        )
        
        return navigationController
    }
}
