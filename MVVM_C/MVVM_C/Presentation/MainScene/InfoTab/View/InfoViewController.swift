//
//  InfoViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

final class InfoViewController: UIViewController {
    
    weak var infoTapCoordinator: InfoTabCoordinator?
    weak var mainTabBarCoordinator: MainTabBarCoordinator?
    weak var appCoordinator: AppCoordinator?

    let exLabel = {
        let label = UILabel()
        label.text = "InfoView"
        return label
    }()
    
    lazy var editButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var settingButton = {
        let button = UIButton()
        button.setTitle("setting", for: .normal)
        button.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc
    func editButtonTapped() {
        print("editButtonTapped")
        appCoordinator?.showLoginViewController()
    }
    
    @objc
    func settingButtonTapped() {
        mainTabBarCoordinator?.start()
        print("settingButtonTapped")
    }
    
    private func configureUI() {
        view.backgroundColor = .brown
        view.addSubview(exLabel)
        view.addSubview(editButton)
        view.addSubview(settingButton)
        
        exLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        editButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(exLabel.snp.bottom).offset(20)
        }
        
        settingButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(editButton.snp.bottom).offset(20)
        }
        
    }
}
