//
//  PersonView.swift
//  UIKitCrashCourse
//
//  Created by Deokhun KIM on 2023/03/06.
//

import UIKit

class PersonView: UIView {
    //뷰컨트롤러에 있는 UI를 여기서 구성
    
    //1.setup 함수 내에 많은 UI로직이 있는 것 선호하지 않음. 클로저 내에 캡슐화하여 설정하기
    //2.lazy로 클로저 내에서 실제로 버튼을 만들지 않고 사용할때 생성하므로 성능 향상
    private lazy var subscribeBtn: UIButton = {
        //버튼 구성
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased()
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let btn = UIButton(configuration: config)
        //translatesAutoresizingMaskIntoConstraints를 false로 설정해야 NSLayoutConstraint 제약 먹힘!!
        btn.translatesAutoresizingMaskIntoConstraints = false
        //버튼에 Target설정하고 연결
        //target: 이 뷰컨트롤러 자체에 있으므로 self, action: 버튼 눌렀을때 트리거되는 함수, selector사용, for: 터치했을때 실행
        btn.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        return btn
    }()
    
    //뷰에 사용한 lable 생성
    private lazy var nameLBl: UILabel = {
       
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "thekoon"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        return lbl
    }()
    
    private lazy var emailLBl: UILabel = {
       
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "thekoon0456@gmail.com" //나중에 데이터 전달
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    //autoLayout 설정 위한 StackView 생성
    private lazy var personStackVw: UIStackView = {
        
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical //수직, 수평 스택뷰 설정
        vw.spacing = 8 //스택뷰 내 개체간 거리
        return vw
    }()
    
    //init peopleView가 초기화되고 초기화 프레임을 생성할때 실행될 코드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PersonView {
    
    func setup() {
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        //2.내부에 stackView추가, stackView는 쌓이는 만큼 높이 알아서 조정하므로 크기 따로 설정할 필요 없음
        self.addSubview(personStackVw)
        
        personStackVw.addArrangedSubview(nameLBl)
        personStackVw.addArrangedSubview(emailLBl)
        personStackVw.addArrangedSubview(subscribeBtn)
        
        //오토 레이아웃 구성 (제약조건 적용)
        //personContainerVw에 제약조건 추가하고
        //컨테이너 내의 스택뷰 추가
        NSLayoutConstraint.activate([
            //            //personContainerVw 추가하고 중앙정렬
            //            personContainerVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //            //center로 안하고 leading, trailing 고정해서 꽉 채움 /constant로 padding처럼 사용. 밀어넣으므로 trailing방향에서는 음수
            //            personContainerVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            //            personContainerVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            //스택뷰 추가하고 모든 레이아웃을 측면에 고정
            personStackVw.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStackVw.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            personStackVw.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            personStackVw.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ])
    }
    
    @objc func didTapSubscribe(sender: UIButton) {
        print("구독함")
    }
}
