//
//  InfoTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol InfoTabCoordinatorDelegate: AnyObject {
    
}

final class InfoTabCoordinator: BaseCoordinator {
    
    weak var delegate: InfoTabCoordinatorDelegate?

    var type: CoordinatorType = .app

    override func start() {
        let infoViewController = InfoViewController()
        infoViewController.infoTapCoordinator = self
        navigationController.viewControllers = [infoViewController]
    }
}
