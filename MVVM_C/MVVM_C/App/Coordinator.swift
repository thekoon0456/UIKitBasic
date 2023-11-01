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

//Coordinator 프로토콜 채택한 공통 BaseCoordinator클래스 만듬. 다른 Coordinator들은 BaseCoordinator상속받음
class BaseCoordinator: Coordinator {

    // MARK: - Property
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Start

    func start() {}
}
