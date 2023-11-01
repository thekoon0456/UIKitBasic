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
    case MainTab
    case Home
    case Map
    case Info
}

//Coordinator: 비즈니스 로직과 flow 로직 분리.
//AnyObject로 클래스에서 사용, weak var 사용해 강한참조 예방
protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
