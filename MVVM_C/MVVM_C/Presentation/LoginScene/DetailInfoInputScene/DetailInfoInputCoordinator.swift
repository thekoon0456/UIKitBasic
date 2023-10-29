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
    
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .next
    var delegate: LoginCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("DetailInfoInputCoordinator 해제")
    }
    
    func start() { //DetailInfoInputViewController 만들어서 보여줌
        let detailInfoInputViewController = DetailInfoInputViewController()
        detailInfoInputViewController.delegate = self
        navigationController.pushViewController(detailInfoInputViewController, animated: true)
//        navigationController.viewControllers = [detailInfoInputViewController]
    }
    
    //화면 하나 더 들어가면
    func showDetailScreen() {
        print("뎁스 하나 더 들어감(다음 코디네이터 생성)")
    }
}

extension DetailInfoInputCoordinator: DetailInfoInputControllerDelegate {
    func navigationToDetails() {
        showDetailScreen()
    }
}


