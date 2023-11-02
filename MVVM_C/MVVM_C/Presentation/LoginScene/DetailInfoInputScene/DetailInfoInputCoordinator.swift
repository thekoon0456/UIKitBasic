//
//  DetailInfoInputCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import Foundation

protocol DetailInfoInputCoordinatorDelegate: AnyObject {
    func showMainTabView()
}

final class DetailInfoInputCoordinator: BaseCoordinator, DetailInfoInputViewControllerDelegate {
    
    var delegate: DetailInfoInputCoordinatorDelegate?
    
    override func start() {
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.delegate = self
        navigationController.pushViewController(detailInfoInputViewController, animated: true)
    }
    
    deinit {
        print("DetailInfoInputCoordinator 해제")
    }
    
    // MARK: - Pop
    
    func showMainTabView() {
        print("DetailInfoInputCoordinator \(childCoordinators)")
        removeFromChildCoordinators(coordinator: self)
        delegate?.showMainTabView()
    }
}
