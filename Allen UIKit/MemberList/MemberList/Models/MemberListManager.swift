//
//  MemberListManager.swift
//  MemberList
//
//  Created by Deokhun KIM on 2023/05/13.
//

import Foundation

//배열 담기
//비즈니스 로직
//뷰컨트롤러에서 어떤 요청이 올지 고려해서 설계
final class MemberListManager {
    
    private var membersList: [Member] = []
    
    //뷰컨에서 호출하면 배열에 담아서 줌
    func makeMemersListDatas() {
        membersList = [
            Member(name: "홍길동", age: 20, phone: "010-1111-2222", address: "서울"),
            Member(name: "임꺽정", age: 23, phone: "010-2222-3333", address: "서울"),
            Member(name: "스티브", age: 50, phone: "010-1234-1234", address: "미국"),
            Member(name: "쿡", age: 30, phone: "010-4844-0456", address: "캘리포니아"),
            Member(name: "베조스", age: 50, phone: "010-2222-7777", address: "하와이"),
            Member(name: "베트맨", age: 40, phone: "010-3333-1234", address: "고담씨티"),
            Member(name: "조커", age: 40, phone: "010-4321-1234", address: "고담씨티")
        ]
    }
    
    //전체 멤버 리스트 얻기
    func getMemberList() -> [Member] {
        return membersList
    }
    
    //새로운 멤버 만들기
    func makeNewmember(_ member: Member) {
        return membersList.append(member)
    }
    
    //기존 멤버의 정보 업데이트
    func updateMemberInfo(index: Int, _ member: Member) {
        return membersList[index] = member
    }
    
    //특정 멤버 정보 얻기 (서브스크립트 구현)
    subscript(index: Int) -> Member {
        get {
            return membersList[index]
        }
        set {
            membersList[index] = newValue
        }
    }
    
}
