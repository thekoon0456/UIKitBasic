//
//  ViewController.swift
//  N&TFirstCode
//
//  Created by Deokhun KIM on 2023/05/09.
//

import UIKit

class FirstViewController: UIViewController {
    
    //로그인 여부 저장하는 속성
    var isLoggedIn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        //네비게이션바 설정 관련!!
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() //불투명으로
//        appearance.configureWithTransparentBackground() //투명으로
//        appearance.backgroundColor = .brown //색상 설정
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
        
        //로그인되어있지 않다면 로그인화면 띄우기
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
        
        //push가 present, pop이 dismiss
//        let vc = LoginViewController()
//        navigationController?.pushViewController(LoginViewController(), animated: true)
//        navigationController?.popViewController(animated: true)
        
    }


}

