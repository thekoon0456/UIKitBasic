//
//  Team.swift
//  Football Chants
//
//  Created by Deokhun KIM on 2023/02/21.
//

import Foundation

//struct에서 안에 값을 바꿀수록 새로운 복사본이 만들어짐 관리하기 어려움, 일관된 값 참조하기 위해 class로 변경, init해주기
class Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool //값 변경 가능하게 var로

    //Generate Memberwise initializer
    internal init(id: TeamType, name: String, info: String, manager: Manager, founded: String, isPlaying: Bool = false) {
        self.id = id
        self.name = name
        self.info = info
        self.manager = manager
        self.founded = founded
        self.isPlaying = isPlaying
    }
    
}
