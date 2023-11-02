//
//  MapTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol MapTabCoordinatorDelegate {
    
}

final class MapTabCoordinator: BaseCoordinator {
    
    weak var delegate: MainTabBarCoordinator?
    var type: CoordinatorType = .app
    
    override func start() {
        
    }
    
    deinit {
        print("MapTabCoordinator 해제")
    }
    
}
