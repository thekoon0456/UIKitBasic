//: [Previous](@previous)

import Foundation
import Combine

/*
 # Subscription

 - Subscriber 가 Publisher가 연결됨을 나타내는 녀석
 - 쉽게 생각하면, Publisher 가 발행한 구독 티켓
 - 이 구독 티켓만 있으면, 데이터를 받을수 있음
 - 이 구독 티켓이 사라지면 구독 관계도 사라짐
 - `Cancellable` protocol을 따르고 있음
 - 따라서, Subscription 을 통해 연결을 Cancel 할수 있음
 */


let subject = PassthroughSubject<String, Never>()

// The print() operator prints you all lifecycle events
let subscription = subject
    .print() //관계 확인 메소드
    .sink { value in
        print("Subscriber received value: \(value)")
    }

/* .print()
 receive subscription: (PassthroughSubject)
 request unlimited
 receive value: (Hello)
 Subscriber received value: Hello
 receive value: (Hello again!)
 Subscriber received value: Hello again!
 receive value: (Hello for the last time!)
 Subscriber received value: Hello for the last time!
 receive finished
 
 */
subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")

//관계 끝내기. publisher가 끊거나, subscriber가 끊거나
subject.send(completion: .finished) //publisher가 끊음
subscription.cancel() //Cancellable프로토콜 따름. subscriber가 관계를 끊음. 데이터를 더 보내도 받지 않음

subject.send("Hello ?? :(") //데이터를 더 보내도 받지 않음

/*
 Subscriber received value: Hello
 Subscriber received value: Hello again!
 Subscriber received value: Hello for the last time!
 */


//: [Next](@next)
