//
//  LoginViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func login() //로그인 한 뒤 뷰로
    func goToDetail() //DetailInfoView로
}

final class LoginViewController: UIViewController {

    weak var delegate: LoginViewControllerDelegate?
    
    private lazy var loginExButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가 정보 입력으로", for: .normal)
        button.addTarget(self, action: #selector(exButtonTapped), for: .touchUpInside)
        return button
    }()
    
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
    
    @objc
    func exButtonTapped() {
        print("exButtonTapped")
        delegate?.goToDetail()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        let item = UIBarButtonItem(title: "로그인",
                                   style: .plain,
                                   target: self,
                                   action: #selector(loginButtonTapped))
        navigationItem.rightBarButtonItem = item
        
        view.addSubview(loginExButton)
        loginExButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}