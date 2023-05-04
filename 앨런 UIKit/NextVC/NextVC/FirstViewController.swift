//
//  FirstViewController.swift
//  NextVC
//
//  Created by Deokhun KIM on 2023/05/04.
//

import UIKit

final class FirstViewController: UIViewController {

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.text = someString //.text 자체가 옵셔널 타입이라 언래핑 따로 안해도 됨
        return label
    }()
    
    private let backButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    //데이터 전달받는 변수. 옵셔널로 해서 생성자 만들지 않음. 기본값 = ""로 하기도 함
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    func configureUI() {
        view.backgroundColor = .gray
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func backButtonTapped() {
        //화면 넘어올때는 present,
        //다시 화면으로 넘어갈때는 dismiss
        dismiss(animated: true)
    }
    

}
