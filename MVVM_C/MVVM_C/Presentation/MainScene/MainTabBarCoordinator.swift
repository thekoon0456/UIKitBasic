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
        //탭바 안이므로 네비컨트롤러 각각 새로 생성
        let homeTabCoordinator = HomeTabCoordinator(navigationController: UINavigationController())
        let mapTabCoordinator = MapTabCoordinator(navigationController: UINavigationController())
        let infoTabCoordinator = InfoTabCoordinator(navigationController: UINavigationController())
        
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
        
        let homeTableViewController = HomeViewController()
        let homeNavigation: UINavigationController = makeNavigationController(
            rootViewController: homeTableViewController,
            title: "Home",
            tabbarImage: "house",
            tag: 0
        )
        
        let mapViewController = MapViewController()
        let mapNavigation: UINavigationController = makeNavigationController(
            rootViewController: mapViewController,
            title: "Map",
            tabbarImage: "map",
            tag: 1
        )
        
        
        let infoViewController = InfoViewController()
        let infoNavigation: UINavigationController = makeNavigationController(
            rootViewController: infoViewController,
            title: "Info",
            tabbarImage: "info.square",
            tag: 2
        )
        
        mainTabBarController = MainTapBarController(
            viewModel: MainViewModel(),
            pages: [homeNavigation,
                    mapNavigation,
                    infoNavigation]
        )
        
        mainTabBarController.tabBarDelegate = self
        navigationController.viewControllers = [mainTabBarController]
    }
    
    private func makeNavigationController(
        rootViewController rootVC: UIViewController,
        title: String,
        tabbarImage: String,
        tag: Int
    ) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: rootVC)
        
        // TODO: - SET TabBar Image (add image constant to function input area)
        
        navigation.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: tabbarImage),
            tag: tag
        )
        
        return navigation
    }
}
