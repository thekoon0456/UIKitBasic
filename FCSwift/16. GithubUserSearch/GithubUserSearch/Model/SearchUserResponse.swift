//
//  SearchUserResponse.swift
//  GithubUserSearch
//
//  Created by Deokhun KIM on 2023/03/14.
//

import Foundation

struct SearchUserResponse: Decodable {
    var items: [SearchResult]
}
