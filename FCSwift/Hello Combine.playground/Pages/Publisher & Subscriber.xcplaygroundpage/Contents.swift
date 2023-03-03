//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
/*
 # Publisher
 - 데이터 배출하는 친구
     - 구체적인 output 및 실패 타입을 정의함
     - Subscriber 가 요청한것 만큼 데이터를 제공
 - 빌트인 Publisher인 `Just`, `Future` 가 있음
     - `Just` 는 값을 다루고
     - `Future` 는 Function 을 다룸
 - iOS 에서는 자동으로 제공해주는 녀석들이 있음
     - NotificationCenter
     - Timer
     - URLSession.dataTask
 
 
 # Subscriber
 - Publisher 에게 데이터 요청함
 - Input, Failure 타입이 정의 필요함
 - Publisher 구독후, 갯수를 요청함
 - 파이프라인을 취소할 수 있음
 - 빌트인 Subscriber인  `assign` 과 `sink` 가 있음
     - `assign` 는 Publisher가 제공한 데이터를 특정 객체의 키패스에 할당
     - `sink` 는 Publisher가 제공한 데이터를 받을수 있는 클로져를 제공함
 */

//Just퍼블리셔: Just: 값을 다룸. 데이터 한번만 전송하고 끝 / future: func 다룸
let just = Just(1000)
let subscription = just.sink { value in
    print("Received Value: \(value)")
}
//Received Value: 1000



let arrayPublisher = [1,3,5,7,9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received Value: \(value)")
}
//데이터가 배열에서 하나씩 옴
/*
Received Value: 1
Received Value: 3
Received Value: 5
Received Value: 7
Received Value: 9
*/


//assign
class MyClass {
    var property: Int = 0 {
        didSet {
            print("Did set property to \(property)")
        }
    }
}

let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
//.assign: 이 object에 어떤 property에 값을 할당할것인가
//arrayPublisher가 배열을 하나씩 배출하면 object의 var property에 값을 하나씩 할당해줌. 할당할때마다 프린트됨
print("Final Value: \(object.property)") //Final Value: 9, 최종적으로 9가 할당되어있음
/*
 Did set property to 1
 Did set property to 3
 Did set property to 5
 Did set property to 7
 Did set property to 9
 Final Value: 9
 */

object.property = 3
//Did set property to 3

//: [Next](@next)


