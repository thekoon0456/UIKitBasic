//
//  DetailInfoInputCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import Foundation

protocol DetailInfoCoordinatorDelegate: AnyObject {
    func dismissViewController()
}

final class DetailInfoCoordinator: BaseCoordinator, DetailInfoViewControllerDelegate {

    weak var delegate: DetailInfoCoordinatorDelegate?
    
    override func start() {
        print("DetailInfoCoordinator - start")
        let detailInfoViewController = DetailInfoViewController()
        detailInfoViewController.delegate = self
        navigationController.pushViewController(detailInfoViewController, animated: true)
    }
    
    func dismissViewController() {
        childCoordinators = self.childCoordinators.filter { $0 !== self }
        delegate?.dismissViewController()
    }
}
