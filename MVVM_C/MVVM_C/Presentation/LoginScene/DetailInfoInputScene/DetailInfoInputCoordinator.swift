//
//  DetailInfoInputCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import UIKit

protocol DetailInfoInputCoordinatorDelegate: AnyObject {
    func showMainTabView()
}

final class DetailInfoCoordinator: Coordinator, DetailInfoViewControllerDelegate {
    
    var delegate: DetailInfoInputCoordinatorDelegate?
    
    override func start() {
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.delegate = self
        navigationController?.pushViewController(detailInfoInputViewController, animated: true)
    }
    
    deinit {
        print("DetailInfoInputCoordinator 해제")
    }
    
    func start() {
        print("DetailInfoCoordinator - start")
        let viewController = DetailInfoViewController()
        viewController.delegate = self
        navigationController.viewControllers = [viewController]
//        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showMainTabView() {
        print("DetailInfoInputCoordinator \(childCoordinators)")
        removeFromChildCoordinators(coordinator: self)
        delegate?.showMainTabView()
    }
}
