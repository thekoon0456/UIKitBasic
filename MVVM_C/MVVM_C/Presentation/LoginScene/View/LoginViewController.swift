//
//  LoginViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func login()
}

final class LoginViewController: UIViewController {

    weak var delegate: LoginViewControllerDelegate?
    
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
        print("로그인 버튼 눌림")
        //LoginCoordinator로 로그인 사실 알려야함
        delegate?.login()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        let item = UIBarButtonItem(title: "로그인",
                                   style: .plain,
                                   target: self,
                                   action: #selector(loginButtonTapped))
        navigationItem.rightBarButtonItem = item
    }
}
