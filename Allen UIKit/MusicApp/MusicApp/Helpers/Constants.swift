//
//  Constants.swift
//  MusicApp
//
//  Created by Deokhun KIM on 2023/05/21.
//

import UIKit

//MARK: - Name Space 만들기

// 데이터 영역에 저장 (열거형, 구조체 다 가능 / 전역 변수로도 선언 가능)
// 사용하게될 API 문자열 묶음
public enum MusicApi {
    static let requestUrl = "https://itunes.apple.com/search?"
    static let mediaParam = "media=music"
    //열거형은 init 따로 안만들고(case 안만들고) static let만 선언, private init() 안해도 되는 장점.
    //열거형은 저장속성 못만듬. 타입저장속성만 만들 수 있음.
}


// 사용하게될 Cell 문자열 묶음
public struct Cell {
    static let musicCellIdentifier = "MusicCell"
    static let musicCollectionViewCellIdentifier = "MusicCollectionViewCell"
    private init() {} //init() 구조체 인스턴스 생성 막기. 문자열 접근해서 사용만 하도록
}



// 컬렉션뷰 구성을 위한 설정
public struct CVCell {
    static let spacingWitdh: CGFloat = 1
    static let cellColumns: CGFloat = 3
    private init() {}
}


//let REQUEST_URL = "https://itunes.apple.com/search?"
