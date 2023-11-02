//
//  MapTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol MapTabCoordinatorDelegate {
    
}

final class MapTabCoordinator: Coordinator {
    
    weak var delegate: MainTabBarCoordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    deinit {
        print("MapTabCoordinator 해제")
    }
    
}
