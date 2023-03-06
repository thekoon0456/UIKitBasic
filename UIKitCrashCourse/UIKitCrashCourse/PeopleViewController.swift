//
//  PeopleViewController.swift
//  UIKitCrashCourse
//
//  Created by Deokhun KIM on 2023/03/06.
//

import UIKit

class PeopleViewController: UIViewController {


    //UIView만들고 다른 모든 요소에 대한 컨터이너로 사용
    private lazy var personContainerVw: UIView = {
        
        let vw = UIView()
        vw.layer.cornerRadius = 10
        vw.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("하이")
        setup()
        
    }

}
//코드베이스로 만들때는 배경까지 모든걸 설정해줘야 함
//기능별로 나눠서 함수 만듬
private extension PeopleViewController {
    func setup() {
        self.view.backgroundColor = .white
        //addSubView로 화면에 구체적인 뷰 추가
        
        //실제 뷰 구현
        //1.UIVew 먼저 추가
        self.view.addSubview(personContainerVw)
        //2.내부에 stackView추가, stackView는 쌓이는 만큼 높이 알아서 조정하므로 크기 따로 설정할 필요 없음
        personContainerVw.addSubview(personStackVw)
        
        personStackVw.addArrangedSubview(nameLBl)
        personStackVw.addArrangedSubview(emailLBl)
        personStackVw.addArrangedSubview(subscribeBtn)
        
        //오토 레이아웃 구성 (제약조건 적용)
        //personContainerVw에 제약조건 추가하고
        //컨테이너 내의 스택뷰 추가
        NSLayoutConstraint.activate([
            //personContainerVw 추가하고 중앙정렬
            personContainerVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //center로 안하고 leading, trailing 고정해서 꽉 채움 /constant로 padding처럼 사용. 밀어넣으므로 trailing방향에서는 음수
            personContainerVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personContainerVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            //스택뷰 추가하고 모든 레이아웃을 측면에 고정
            personStackVw.topAnchor.constraint(equalTo: personContainerVw.topAnchor, constant: 8),
            personStackVw.bottomAnchor.constraint(equalTo: personContainerVw.bottomAnchor, constant: -8),
            personStackVw.leadingAnchor.constraint(equalTo: personContainerVw.leadingAnchor, constant: 8),
            personStackVw.trailingAnchor.constraint(equalTo: personContainerVw.trailingAnchor, constant: -8),
            
        ])
        
    }
    
    @objc func didTapSubscribe(sender: UIButton) {
        print("구독함")
    }
}



