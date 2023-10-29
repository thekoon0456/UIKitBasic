//
//  MainViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

import SnapKit

protocol MainTabBarControllerDelegate: AnyObject {
    func logout()
}

final class MainTapBarController: UITabBarController {
    
    weak var tabBardelegate: MainTabBarControllerDelegate?
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
        
        viewControllers = pages
        
        view.backgroundColor = .white
        tabBar.tintColor = .black
    }
}
