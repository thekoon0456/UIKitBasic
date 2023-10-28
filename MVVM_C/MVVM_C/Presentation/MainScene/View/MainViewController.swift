//
//  MainViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/24/23.
//

import UIKit

import SnapKit

protocol MainViewControllerDelegate: AnyObject {
    func logout()
}

final class MainViewController: UIViewController {
    
    weak var delegate: MainViewControllerDelegate?
    
    private lazy var naviButton = {
        let button = UIButton()
        button.setTitle("다음 뷰로 가기", for: .normal)
        button.addTarget(self,
                         action: #selector(nextButtonClicked),
                         for: .touchUpInside)
        button.setTitleColor(.label, for: .normal)

        return button
    }()
    
    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    deinit {
        print("MainViewController해제")
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
        
        view.addSubview(naviButton)
        naviButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }
    
    @objc
    func nextButtonClicked() {
//        delegate?.nextVC()
    }
}
