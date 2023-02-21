//
//  Manager.swift
//  Football Chants
//
//  Created by Deokhun KIM on 2023/02/21.
//

import Foundation

//감독인지 헤드코치인지 구분
enum JobType: String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name: String
    let job: JobType
}
