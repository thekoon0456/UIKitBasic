//
//  ViewController.swift
//  LoginProject
//
//  Created by Deokhun KIM on 2023/05/07.
//

import UIKit

final class ViewController: UIViewController {
    
    //LoginView 인스턴스 생성해 사용
    private let loginView = LoginView()
    
    //MARK: - loadView()는 viewDidLoad() 보다 먼저 호출됨. 뷰를 교체해줄 수 있음. loginView를 view에 할당
    override func loadView() {
        // super.loadView() 필요없음
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        setupAddTarget()
    }
    
    //MARK: - addTarget 함수로 연결
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    // 로그인 버튼 누르면 동작하는 함수
    @objc func loginButtonTapped() {
        // 서버랑 통신해서, 다음 화면으로 넘어가는 내용 구현
        print("다음 화면으로 넘어가기")
    }
    
    // 리셋버튼이 눌리면 동작하는 함수
    @objc func resetButtonTapped() {
        //만들기
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        //present는 뷰컨트롤러에서 호출할 수 있는 함수.
        self.present(alert, animated: true, completion: nil)
    }
    
}


