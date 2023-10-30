//
//  DetailInfoInputCoordinator.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/28/23.
//

import UIKit

protocol DetailInfoInputCoordinatorDelegate: AnyObject {
    func exButtonDidTapped(_ coordinator: DetailInfoInputCoordinator)
}

class DetailInfoInputCoordinator: CoordinatorProtocol {
    var parentCoordinator: LoginCoordinator?
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .next
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("DetailInfoInputCoordinator 해제")
    }
    
    func start() { //DetailInfoInputViewController 만들어서 보여줌
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.coordinator = self
        detailInfoInputViewController.delegate = self
        navigationController.pushViewController(detailInfoInputViewController, animated: true)
//        navigationController.viewControllers = [detailInfoInputViewController] //ㅇ 안쓸때
    }
    
    //화면 하나 더 들어가면
    func showDetailScreen() {
        print("메인탭뷰")
        parentCoordinator?.start()
    }
}

extension DetailInfoInputCoordinator: DetailInfoInputControllerDelegate {
    func navigationToDetails() {
        showDetailScreen()
    }
}
