//
//  LoginViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginViewControllerDelegate {
    func login()
}

final class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "로그인",
                                   style: .plain,
                                   target: self,
                                   action: #selector(loginButtonDidTap))
        navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        print("LoginViewController 해제")
    }
    
    @objc
    func loginButtonDidTap() {
        print("로그인 버튼 눌림")
        delegate?.login()
    }
}
