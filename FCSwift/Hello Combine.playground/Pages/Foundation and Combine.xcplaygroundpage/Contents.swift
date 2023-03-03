//: [Previous](@previous)

import Foundation
import Combine
import UIKit

/*
 # Publisher

 - 데이터 배출하는 친구
 - iOS 에서는 자동으로 제공해주는 녀석들이 있음
     - NotificationCenter
     - Timer
     - URLSession.dataTask
 */


// URLSessionTask: Publisher and JSON Decoding Operator //URLSession: 서버에서 데이터를 받아올때 사용
struct SomeDecodable: Decodable {}

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!) //dataTaskPublisher: 특정 url에 데이터 리퀘스트 보냄
    .map { data, response in
        return data //데이터로 리턴하고
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder()) //받은 데이터를 디코딩함


// Notifications

let center = NotificationCenter.default //데이터 전송을 noti에 실어서 보냄
let noti = Notification.Name("MyNoti") //퍼블리셔
let notiPublisher = center.publisher(for: noti, object: nil) //noti 데이터를 publishing 함
let subscription1 = notiPublisher.sink { _ in
    print("Noti Received") //noti받으면 프린트되게
}

center.post(name: noti, object: nil)
subscription1.cancel() //구독 해제



// KeyPath binding to NSObject instances
let ageLable = UILabel() //UILable()은 NSObject
print("text: \(ageLable.text)")

Just(28)
    .map { "Age is \($0)"}
    .assign(to: \.text, on: ageLable) //\.text가 키패스 UILable에 할당할 수 있음
print("text: \(ageLable.text)")


// Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함
let timerPublisher = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

let subscription2 = timerPublisher.sink { item in
    print("time: \(item)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription2.cancel()
}
//: [Next](@next)
