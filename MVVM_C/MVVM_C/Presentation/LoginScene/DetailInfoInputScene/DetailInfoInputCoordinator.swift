//
//  DetailInfoInputCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import Foundation

protocol DetailInfoInputCoordinatorDelegate: AnyObject {
    func popViewController()
}

final class DetailInfoInputCoordinator: BaseCoordinator, DetailInfoInputViewControllerDelegate {
    
    weak var delegate: DetailInfoInputCoordinatorDelegate?
    
    override func start() {
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.delegate = self
        navigationController.pushViewController(detailInfoInputViewController, animated: true)
    }
    
    // MARK: - Pop
    
    func popViewController() {
        delegate?.popViewController()
    }
}
