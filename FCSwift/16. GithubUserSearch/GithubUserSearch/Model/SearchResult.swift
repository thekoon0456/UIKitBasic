//
//  User.swift
//  GithubUserSearch
//
//  Created by Deokhun KIM on 2023/03/14.
//

import Foundation

struct SearchResult: Hashable, Identifiable, Decodable {
    
    var id: Int64
    var login: String
    var avatarUrl: URL
    var htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}
