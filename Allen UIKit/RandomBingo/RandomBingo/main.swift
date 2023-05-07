//
//  main.swift
//  RandomBingo
//
//  Created by Deokhun KIM on 2023/04/28.
//

import Foundation

//main.swift 파일이 main()함수처럼 작동. 앱을 키면 main.swift가 실행됨

//컴퓨터가 정한 랜덤 숫자
var computerChoice = Int.random(in: 1...100)
//내가 입력한 숫자
var myChoice: Int = 0

while true { //조건에 따라 반복 필요. while문
    //디버그 영역에서 읽어오는 함수
    var userInput = readLine() //옵셔널 타입
    
    if let input = userInput {
        if let number = Int(input) { //Int 변환도 옵셔널 타입
            myChoice = number
        }
    }
    
    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("Bingo")
        break //빙고시에 반복문 종료
    }
}
//코드가 더 없어서 프로그램 종료됨. 반복문으로 계속 실행
