//
//  PeopleViewController.swift
//  UIKitCrashCourse
//
//  Created by Deokhun KIM on 2023/03/06.
//

import UIKit

class PeopleViewController: UIViewController {

    //UIView만들고 다른 모든 요소에 대한 컨터이너로 사용
    private lazy var personVw: PersonView = {
        
        let vw = PersonView()
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
        self.view.addSubview(personVw)
        
        NSLayoutConstraint.activate([
            //personContainerVw 추가하고 중앙정렬
            personVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //center로 안하고 leading, trailing 고정해서 꽉 채움 /constant로 padding처럼 사용. 밀어넣으므로 trailing방향에서는 음수
            personVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
        
    }
    
}



