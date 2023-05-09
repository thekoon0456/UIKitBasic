//
//  Movie.swift
//  TableView
//
//  Created by Deokhun KIM on 2023/05/09.
//

import UIKit

struct Movie {
    //image는 없는 경우를 대비해 옵셔널로 선언할거라서 var로 선언
    var movieImage: UIImage?
    let movieTitle: String
    let movieDesciption: String
}
