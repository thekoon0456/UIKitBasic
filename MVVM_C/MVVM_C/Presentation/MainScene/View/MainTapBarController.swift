//
//  MainViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

import SnapKit

protocol MainTapBarControllerDelegate: AnyObject {
    func pushToLoginViewController()
    func homeTabTapped()
    func mapTabTapped()
    func infoTabTapped()
    
}

final class MainTapBarController: UITabBarController {
    
    weak var tapbarDelegate: MainTapBarControllerDelegate?
    var pages: [UINavigationController]
    var viewModel: MainTabViewModel
    
//    // MARK: - Initializers
    init(viewModel: MainTabViewModel, pages: [UINavigationController]) {
        self.viewModel = viewModel
        self.pages = pages
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        print("MainTapBarController 등장")
    }
    
    deinit {
        print("MainTapBarController해제")
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        //뷰컨 설정
        viewControllers = pages
        
        view.backgroundColor = .white
        tabBar.tintColor = .black
        
        let item = UIBarButtonItem(title: "로그아웃",
                                   style: .plain,
                                   target: self,
                                   action: #selector(logOutButtonTapped))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc
    func logOutButtonTapped() {
        print("로그아웃 버튼 눌림")
        //LoginCoordinator로 로그인 사실 알려야함
        tapbarDelegate?.pushToLoginViewController()
    }
}

extension MainTapBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
            switch index {
            case 0:
                tapbarDelegate?.homeTabTapped()
            case 1:
                tapbarDelegate?.mapTabTapped()
            case 2:
                tapbarDelegate?.infoTabTapped()
            default:
                break
            }
        }
    }
}
