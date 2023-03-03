//: [Previous](@previous)

import Foundation
import Combine

//Operator: 중간 역할자


// Transform - Map: 데이터 가공해서 넘겨줌
let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
    .map { $0 * 2 }
    .sink { value in
        print("Transformed Value: \(value)")
    }

numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscription1.cancel()

/*
Transformed Value: 20
Transformed Value: 40
Transformed Value: 60
*/


// Filter: 넘겨받은 데이터 중에 일부 조건 만족하는 경우만 넘겨줌
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print("Filtered Value: \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("Jack")
stringPublisher.send("Joon")
stringPublisher.send("Jenny")
stringPublisher.send("Jason")
subscription2.cancel()

//: [Next](@next)
