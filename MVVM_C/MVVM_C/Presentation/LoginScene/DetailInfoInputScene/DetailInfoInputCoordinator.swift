//
//  DetailInfoInputCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import Foundation

protocol DetailInfoCoordinatorDelegate: AnyObject {
    func popViewController()
}

final class DetailInfoCoordinator: BaseCoordinator, DetailInfoViewControllerDelegate {
    
    weak var delegate: DetailInfoCoordinatorDelegate?
    
    override func start() {
        let detailInfoViewController = DetailInfoViewController()
        detailInfoViewController.delegate = self
        navigationController.pushViewController(detailInfoViewController, animated: true)
    }
    
    // MARK: - Pop
    
    func popViewController() {
        delegate?.popViewController()
    }
}
