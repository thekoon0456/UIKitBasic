//
//  Main.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol MainTabBarCoordinatorDelegate {
    func pushToLoginViewController()
}

final class MainTabBarCoordinator: BaseCoordinator, MainTapBarControllerDelegate, HomeTabCoordinatorDelegate, MaptabCoordinatorDelegate, InfoTabCoordinatorDelegate {
    
    var delegate: MainTabBarCoordinatorDelegate?
    var type: CoordinatorType = .MainTab
    
    lazy var homeNavigationController: UINavigationController = makeNavigationController(
        rootViewController: HomeViewController(),
        title: "Home",
        tabbarImage: "house",
        tag: 0
    )
    lazy var mapNavigationController: UINavigationController = makeNavigationController(
        rootViewController: MapViewController(),
        title: "Map",
        tabbarImage: "map",
        tag: 1
    )
    lazy var infoNavigationController: UINavigationController = makeNavigationController(
        rootViewController: InfoViewController(),
        title: "Info",
        tabbarImage: "info.square",
        tag: 2
    )
    
    deinit {
        print("MainTabBarCoordinator 해제")
    }
    
    override func start() {
        showMainTabController()
    }
    
    //탭바 3개 만들기
    func showMainTabController() {
        let mainTabBarController = MainTapBarController(
            viewModel: MainTabViewModel(),
            pages: [homeNavigationController,
                    mapNavigationController,
                    infoNavigationController]
        )
        mainTabBarController.tapbarDelegate = self
        navigationController.viewControllers = [mainTabBarController]
    }
    
    func startHomeTabController() {
        let homeTabCoordinator = HomeTabCoordinator(navigationController: homeNavigationController)
        homeTabCoordinator.delegate = self
        homeTabCoordinator.start()
        childCoordinators.append(homeTabCoordinator)
    }
    
    func startMapTabController() {
        let mapTabCoordinator = MapTabCoordinator(navigationController: mapNavigationController)
        mapTabCoordinator.delegate = self
        mapTabCoordinator.start()
        childCoordinators.append(mapTabCoordinator)
    }
    
    func startInfoTabController() {
        let infoTabCoordinator = InfoTabCoordinator(navigationController: infoNavigationController)
        infoTabCoordinator.delegate = self
        infoTabCoordinator.start()
        childCoordinators.append(infoTabCoordinator)
    }
    
    //MainTapBarControllerDelegate
    func homeTabTapped() {
        startHomeTabController()
    }
    
    //MainTapBarControllerDelegate
    func mapTabTapped() {
        startMapTabController()
    }
    
    //MainTapBarControllerDelegate
    func infoTabTapped() {
        startInfoTabController()
    }
    
    func pushToLoginViewController() {
        print("MainTabBarCoordinator - pushToLoginViewController")
        delegate?.pushToLoginViewController()
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
