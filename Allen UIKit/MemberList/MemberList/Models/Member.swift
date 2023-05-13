//
//  Member.swift
//  MemberList
//
//  Created by Deokhun KIM on 2023/05/13.
//

import UIKit

//데이터 묶음 일반적으로 구조체로 많이 만듬. 클래스는 구조체보다 무겁기도 하고 느림.
struct Member {
    
    //이름이 없다면, 시스템 사람이미지 세팅
    lazy var memberImage: UIImage? = {
        guard let name = name else { return UIImage(systemName: "person") }
        //해당이름으로 된 이미지가 없다면, 시스템 사람 이미지 세팅
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    //멤버의 (절대적) 순서를 위한 타입 저장 속성
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    //생성자 안에 논리 넣기 위해 생성자 따로 만듬
    init(name: String?, age: Int?, phone: String?, address: String?) {
        
        self.memberId = Member.memberNumbers
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        //멤버를 생성한다면, 항상 타입 저장속성의 정수값 += 1
        Member.memberNumbers += 1
    }
}

