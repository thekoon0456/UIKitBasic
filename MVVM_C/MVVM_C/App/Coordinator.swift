//
//  Coordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import Foundation

//Coordinator: 비즈니스 로직과 flow 로직 분리.
protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
