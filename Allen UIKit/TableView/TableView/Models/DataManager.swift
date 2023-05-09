//
//  DataManager.swift
//  TableView
//
//  Created by Deokhun KIM on 2023/05/09.
//

import UIKit

final class DataManager {
    //빈 배열 만들고 서버와 통신 후 데이터 넣어줌
    var movieDataArray: [Movie] = []
    
    func makeMovieData() {
        movieDataArray = [
            Movie(movieImage: UIImage(named: "batman"), movieTitle: "배트맨", movieDesciption: "배트맨이 출현하는 영화"),
            Movie(movieImage: UIImage(named: "captain"), movieTitle: "캡틴 아메리카", movieDesciption: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
            Movie(movieImage: UIImage(named: "ironman"), movieTitle: "아이언맨", movieDesciption: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화"),
            Movie(movieImage: UIImage(named: "thor"), movieTitle: "토르", movieDesciption: "아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
            Movie(movieImage: UIImage(named: "hulk"), movieTitle: "헐크", movieDesciption: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
            Movie(movieImage: UIImage(named: "spiderman"), movieTitle: "스파이더맨", movieDesciption: "피터 파커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
            Movie(movieImage: UIImage(named: "blackpanther"), movieTitle: "블랙펜서", movieDesciption: "와칸다의 왕위 계승자 티찰과 블랙펜서가 되다."),
            Movie(movieImage: UIImage(named: "doctorstrange"), movieTitle: "닥터스트레인지", movieDesciption: "외과의사 닥터 스트레인지가, 히어로가 되는 과정을 담은 영화"),
            Movie(movieImage: UIImage(named: "guardians"), movieTitle: "가디언즈 오브 갤럭시", movieDesciption: "빌런 타노스에 맞서서 세상을 지키려는 가오겔 멤버들"),
        ]
    }
    
    func getMovieData() -> [Movie] {
        return movieDataArray
    }
    
    func updateMovieData() {
        let movie = Movie(movieImage: UIImage(named: "spiderman2"), movieTitle: "스파이더맨2", movieDesciption: "스파이더맨 시즌2")
        movieDataArray.append(movie)
    }
    
}
