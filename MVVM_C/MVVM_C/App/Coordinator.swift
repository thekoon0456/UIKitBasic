//
//  Coordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

enum CoordinatorType {
    case app
    case login
    case main
    case next
}

//Coordinator: 비즈니스 로직과 flow 로직 분리.
//AnyObject로 클래스에서 사용

protocol CoordinatorProtocol: AnyObject {
    
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    var type: CoordinatorType { get }
    
    //
    func start()
    func popCurrentPage()
}
