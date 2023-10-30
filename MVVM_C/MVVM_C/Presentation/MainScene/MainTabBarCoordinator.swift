//
//  Main.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

final class MainTabBarCoordinator: CoordinatorProtocol {
    
    weak var appCoordinator: AppCoordinator? //순환참조 방지
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .MainTab
    
    private var mainTabBarController: MainTapBarController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("MainCoordinator 해제")
    }
    
    func start() {
        showMainTabController()
        configureViewController()
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
        
        let homeTabCoordinator = HomeTabCoordinator(navigationController: homeNavigationController)
        let mapTabCoordinator = MapTabCoordinator(navigationController: mapNavigationController)
        let infoTabCoordinator = InfoTabCoordinator(navigationController: infoNavigationController)
        
        //childCoordinators에 추가
        childCoordinators.append(homeTabCoordinator)
        childCoordinators.append(mapTabCoordinator)
        childCoordinators.append(infoTabCoordinator)
        
        homeTabCoordinator.mainTabBarCoordinator = self
        mapTabCoordinator.MainTabBarCoordinator = self
        infoTabCoordinator.mainTabBarCoordinator = self
        infoTabCoordinator.appCoordinator = appCoordinator
        
        homeTabCoordinator.start()
        mapTabCoordinator.start()
        infoTabCoordinator.start()
    }
    
    func configureViewController() {
        mainTabBarController.mainTabBarCoordinator = self
        mainTabBarController.appCoordinator = appCoordinator
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
