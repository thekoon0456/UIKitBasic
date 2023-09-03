//
//  Content.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/03.
//

import Foundation

struct Content: Hashable {
    let title: String
    let overview: String
    let posterURL: String
    let vote: String
    let releaseDate: String
    
    init(tv: Tv) {
        title = tv.name
        overview = tv.overview
        posterURL = tv.posterURL
        vote = tv.vote
        releaseDate = tv.firstAirDate
    }
    
    init(movie: Movie) {
        title = movie.name
        overview = movie.overview
        posterURL = movie.posterURL
        vote = movie.vote
        releaseDate = movie.releaseDate
    }
}
