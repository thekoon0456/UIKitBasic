//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates - 같은 데이터 들어오면 중복되는 데이터 제거
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

words.removeDuplicates() //반복되는거 안 받음
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions) //subscriptions이 Set에 저장됨


/*
 hey
 there!
 Mr
 ?
 */


// compactMap - 전환한 내용중 nil인 경우 보내지 않고 nil이 아닌것만 보냄. 옵셔널 아닌 타입으로
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

let float = Float("1.24")

strings.compactMap { Float($0) }
    .sink { value in
        print(value)
    }
    .store(in: &subscriptions)


// ignoreOutput - 새로 들어오는 이벤트 데이터에 더이상 신경쓰지 않을때
let numbers = (1...10_000).publisher

numbers.ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)")}) { print($0) }
    .store(in: &subscriptions)

//Completed with: finished


// prefix - 여러개 데이터 들어올때 앞에 몇개만 받겠다.
let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: { print("Completed with: \($0)")}) { print($0) }
    .store(in: &subscriptions)

/*
 1
 2
 Completed with: finished
 */

//: [Next](@next)
