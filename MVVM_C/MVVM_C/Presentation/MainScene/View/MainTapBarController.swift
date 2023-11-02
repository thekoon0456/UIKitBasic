//
//  MainViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

import SnapKit

protocol MainTapBarControllerDelegate: AnyObject {
    func showLoginView()
}

final class MainTapBarController: UITabBarController {
    
    weak var tapbarDelegate: MainTapBarControllerDelegate?
    var pages: [UINavigationController]
    var viewModel: MainViewModel
    
//    // MARK: - Initializers
    init(viewModel: MainViewModel, pages: [UINavigationController]) {
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
        tapbarDelegate?.showLoginView()
    }
}
