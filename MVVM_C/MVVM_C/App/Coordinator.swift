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
//AnyObject로 클래스에서 사용, weak var 사용해 강한참조 예방
protocol CoordinatorProtocol: AnyObject {
    //기본 함수
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    //추가 함수
    var type: CoordinatorType { get }
    
    //기본 함수
    func start() //모든 coordinator에 포함됨. 뷰컨트롤러, 뷰모델 만들어서 넣음
    
    //추가 함수
    func popCurrentPage()
    func removeFromChildCoordinators(coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {
    //popViewController
    func popCurrentPage() {
        navigationController.popViewController(animated: true)
    }
    //사용 안하는 coordinator 삭제
    func removeFromChildCoordinators(coordinator: CoordinatorProtocol) {
        print("DEBUG: \(coordinator) coordinator 해제")
        let updatedChildCoordinators = childCoordinators.filter { $0 !== coordinator }
        childCoordinators = updatedChildCoordinators
    }
}
