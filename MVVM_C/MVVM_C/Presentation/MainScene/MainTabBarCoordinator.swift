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

final class MainTabBarCoordinator: BaseCoordinator, MainTapBarControllerDelegate, InfoTabCoordinatorDelegate, HomeTabCoordinatorDelegate {
    //InfoTabCoordinatorDelegate
    func showMainTabView() {
        start()
    }
    
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
    
    func start() {
        showMainTabController()
    }
    
    func showLoginView() {
        removeFromChildCoordinators(coordinator: self)
        delegate?.showLoginView()
    }
    
    //탭바 3개 만들기
    func showMainTabController() {
        //탭바 안이므로 각각 컨트롤러를 루트로 한 네비 컨트롤러 새로 생성
        let homeTableViewController = HomeViewController()
        let mapViewController = MapViewController()
        let infoViewController = InfoViewController()
        
        homeTableViewController.viewModel = HomeTabViewModel()
        
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
        childCoordinators.append(homeTabCoordinator)
        childCoordinators.append(mapTabCoordinator)
        childCoordinators.append(infoTabCoordinator)
        
        let mainTabBarController = MainTapBarController(
            viewModel: MainViewModel(),
            pages: [homeNavigationController,
                    mapNavigationController,
                    infoNavigationController]
        )
        
        mainTabBarController.tapbarDelegate = self
        homeTabCoordinator.delegate = self
        mapTabCoordinator.delegate = self
        infoTabCoordinator.delegate = self
        
        homeTabCoordinator.start()
        mapTabCoordinator.start()
        infoTabCoordinator.start()
        
        navigationController?.viewControllers = [mainTabBarController]
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
