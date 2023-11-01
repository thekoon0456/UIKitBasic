//
//  Main.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

final class MainTabBarCoordinator: BaseCoordinator {
    
    weak var delegate: AppCoordinator? //순환참조 방지
    var type: CoordinatorType = .MainTab
    
    deinit {
        print("MainTabBarCoordinator 해제")
    }
    
    override func start() {
        showMainTabController()
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
        
        let homeTabCoordinator = HomeTabCoordinator(navigationController: homeNavigationController)
        let mapTabCoordinator = MapTabCoordinator(navigationController: mapNavigationController)
        let infoTabCoordinator = InfoTabCoordinator(navigationController: infoNavigationController)
        
        //childCoordinators에 추가
//        delegate?.childCoordinators.append(homeTabCoordinator)
//        delegate?.childCoordinators.append(mapTabCoordinator)
//        delegate?.childCoordinators.append(infoTabCoordinator)
        
        var mainTabBarController = MainTapBarController(
            viewModel: MainViewModel(),
            pages: [homeNavigationController,
                    mapNavigationController,
                    infoNavigationController]
        )
        
        homeTabCoordinator.mainTabBarCoordinator = self
        mapTabCoordinator.MainTabBarCoordinator = self
        infoTabCoordinator.mainTabBarCoordinator = self
        infoTabCoordinator.appCoordinator = delegate
        
        homeTabCoordinator.start()
        mapTabCoordinator.start()
        infoTabCoordinator.start()
        
        navigationController.viewControllers = [mainTabBarController]
    }
    
//    func configureViewController() {
//        mainTabBarController.mainTabBarCoordinator = self
////        mainTabBarController.appCoordinator = appCoordinator
//    }
    
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
