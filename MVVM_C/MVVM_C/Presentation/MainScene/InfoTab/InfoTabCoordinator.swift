//
//  InfoTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol InfoTabCoordinatorDelegate {
    func showMainTabView()
}

final class InfoTabCoordinator: BaseCoordinator, InfoViewControllerDelegate {
    
    var delegate: InfoTabCoordinatorDelegate?
    
    var type: CoordinatorType = .app
    
    override func start() {
    }
    
    func showMainTabView() {
        removeFromChildCoordinators(coordinator: self)
        delegate?.showMainTabView()
    }
    
    deinit {
        print("InfoTabCoordinator 해제")
    }
}
