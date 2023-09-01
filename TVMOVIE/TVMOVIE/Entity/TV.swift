//
//  TV.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import Foundation

struct TvListModel: Decodable {
    let page: Int
    let result: [Tv]
}

struct Tv: Decodable {
    let name: String
    let overview: String
    let posterURL: String
    let vote: String
    let firstAirDate: String
    
    private enum CoadingKeys: String, CodingKey {
        case name
        case overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case firstAirDate = "first_air_date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CoadingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        overview = try container.decode(String.self, forKey: .overview)
        let path = try container.decode(String.self, forKey: .posterPath)
        posterURL = "https://image.tmdb.org/t/p/w500/\(path)"
        let voteAverage = try container.decode(String.self, forKey: .voteAverage)
        let voteCount = try container.decode(String.self, forKey: .voteCount)
        vote = "\(voteAverage) \(voteCount)"
        firstAirDate = try container.decode(String.self, forKey: .firstAirDate)
    }
}
