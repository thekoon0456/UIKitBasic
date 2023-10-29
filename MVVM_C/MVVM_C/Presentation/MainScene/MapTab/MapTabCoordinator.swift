//
//  MapTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

final class MapTabCoordinator: CoordinatorProtocol {
    weak var parentCoordinator: MainTabBarCoordinator?
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //
    }
    
    
}
