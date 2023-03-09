//
//  Model.swift
//  UIKitCrashCourse
//
//  Created by Deokhun KIM on 2023/03/09.
//

import Foundation

//api 연동
struct UserResponse: Codable {
    let data: [PersonResponse]
    
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
