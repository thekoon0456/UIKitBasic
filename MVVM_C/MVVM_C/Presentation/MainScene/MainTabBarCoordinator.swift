//
//  Main.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {
    func pushToLoginViewController()
}

final class MainTabBarCoordinator: BaseCoordinator, MainTapBarControllerDelegate, HomeTabCoordinatorDelegate, MaptabCoordinatorDelegate, InfoTabCoordinatorDelegate {
    
    var delegate: MainTabBarCoordinatorDelegate?
    var type: CoordinatorType = .MainTab
    
    deinit {
        print("MainTabBarCoordinator 해제")
    }
    
    override func start() {
        showMainTabController()
    }
    
    func pushToLoginViewController() {
        print("MainTabBarCoordinator - pushToLoginViewController")
        childCoordinators = self.childCoordinators.filter { $0 !== self }
        delegate?.pushToLoginViewController()
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
        
//        let coordinator = DetailInfoCoordinator(navigationController: navigationController)
//        coordinator.delegate = self
//        coordinator.start()
//        childCoordinators.append(coordinator)
        
        let homeTabCoordinator = HomeTabCoordinator(navigationController: homeNavigationController)
        let mapTabCoordinator = MapTabCoordinator(navigationController: mapNavigationController)
        let infoTabCoordinator = InfoTabCoordinator(navigationController: infoNavigationController)
        
        homeTabCoordinator.delegate = self
        mapTabCoordinator.delegate = self
        infoTabCoordinator.delegate = self
        
        homeTabCoordinator.start()
        mapTabCoordinator.start()
        infoTabCoordinator.start()
        
        childCoordinators.append(homeTabCoordinator)
        childCoordinators.append(mapTabCoordinator)
        childCoordinators.append(infoTabCoordinator)
        
        var mainTabBarController = MainTapBarController(
            viewModel: MainTabViewModel(),
            pages: [homeNavigationController,
                    mapNavigationController,
                    infoNavigationController]
        )
        mainTabBarController.tapbarDelegate = self
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
