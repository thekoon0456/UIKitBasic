//
//  MainViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol MainViewControllerDelegate {
    func logout()
}

final class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    deinit {
        print("LoginViewController해제")
    }
    
    // MARK: - Selectors
    
    @objc
    func loginButtonTapped() {
        print("로그아웃 버튼 눌림")
        //LoginCoordinator로 로그인 사실 알려야함
        delegate?.logout()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        let item = UIBarButtonItem(title: "로그아웃",
                                   style: .plain,
                                   target: self,
                                   action: #selector(loginButtonTapped))
        navigationItem.rightBarButtonItem = item
    }
}
