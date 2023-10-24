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

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    private var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소버튼", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        let item = UIBarButtonItem(
            title: "로그아웃",
            style: .plain,
            target: self,
            action: #selector(logoutButtonDidTap)
        )
        
        navigationItem.rightBarButtonItem = item
        
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    deinit {
        print("MainViewController 해제")
    }
    
    @objc
    func logoutButtonDidTap() {
        delegate?.logout()
    }
    
}
