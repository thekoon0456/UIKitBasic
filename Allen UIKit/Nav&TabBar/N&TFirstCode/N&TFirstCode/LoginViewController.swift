//
//  LoginViewController.swift
//  N&TFirstCode
//
//  Created by Deokhun KIM on 2023/05/09.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
//    @objc func nextButtonTapped() {
//        let tabBarVC = UITabBarController()
//
//        //첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
//        let vc1 = UINavigationController(rootViewController: FirstViewController())
//        let vc2 = SecondViewController()
//        let vc3 = ThirdViewController()
//        let vc4 = FourthViewController()
//        let vc5 = FifthViewController()
//
//        //탭바 이름설정
//        vc1.title = "Main"
//        vc2.title = "Search"
//        vc3.title = "Post"
//        vc4.title = "Likes"
//        vc5.title = "Me"
//
//        //탭바로 사용하기 위한 뷰컨트롤러들 설정
//        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
//        tabBarVC.modalPresentationStyle = .fullScreen
//        tabBarVC.tabBar.backgroundColor = .white
//
//        //탭바 이미지 설정
//        guard let items = tabBarVC.tabBar.items else { return }
//        items[0].image = UIImage(systemName: "trash")
//        items[1].image = UIImage(systemName: "folder")
//        items[2].image = UIImage(systemName: "paperplane")
//        items[3].image = UIImage(systemName: "doc")
//        items[4].image = UIImage(systemName: "note")
//
//        //present로 탭바를 띄우기
//        present(tabBarVC, animated: true)
//
//    }

}
