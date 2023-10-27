//
//  Main.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator)
}

final class MainCoordinator: CoordinatorProtocol, MainViewControllerDelegate {

    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.delegate = self //delegate 채택
        
        navigationController.viewControllers = [viewController] //?
    }
    
    //로그인했으면 AppCoordinagor로 알려야함
    func logout() {
        delegate?.didLoggedOut(self) //coordinator self로 보냄
    }
}
