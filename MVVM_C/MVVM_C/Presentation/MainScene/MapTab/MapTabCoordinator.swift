//
//  MapTabCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol MaptabCoordinatorDelegate: AnyObject {
    
}

final class MapTabCoordinator: BaseCoordinator {
    
    weak var delegate: MaptabCoordinatorDelegate?
    
    var type: CoordinatorType = .app
    
    override func start() {
        //
    }
    
    
}
