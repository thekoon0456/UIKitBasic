//: [Previous](@previous)

import Foundation
import Combine

//combineLatest
//두 개의 퍼블리셔를 같이 받음
//둘 다 보낼 데이터가 있어야 됨
//두 퍼블리셔의 최신 데이터 보냄
/*
 "a"                "b"      "c"
      1        2     3                5
 
    a,1       a,2    b,3       c,3    c,5
 */



// Basic CombineLatest: 아웃풋 타입이 달라도 가능
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()



strPublisher.combineLatest(numPublisher) //= Publishers.CombineLatest(strPublisher, numPublisher)
    .sink { str, num in
        print("Receive: \(str), \(num)")
    }

strPublisher.send("a")
numPublisher.send(1)
strPublisher.send("b")
strPublisher.send("c")
numPublisher.send(2)
numPublisher.send(3)
/*
 Receive: a, 1
 Receive: b, 1
 Receive: c, 1
 Receive: c, 2
 Receive: c, 3
 */


// Advanced CombineLatest 응용: 로그인 회원가입 비번, 패스워드 등
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCrendetialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { username, password -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 10
    }
    .sink { valid in
        print("Crendential valid? : \(valid)")
    }

usernamePublisher.send("thekoon")
passwordPublisher.send("weakpw") //false
passwordPublisher.send("verystrongpassword") //true



// Merge : 퍼블리셔가 같은 타입일때만! 합침
let publisher1 = [1,2,3,4,5].publisher
let publisher2 = [300, 400, 500].publisher

let mergedPublisherSubscription = publisher1.merge(with: publisher2) //= Publishers.Merge(publisher1, publisher2)
    .sink { value in
        print("Merge: subscription recevied value: \(value)")
    }

/* 합쳐짐
 Merge: subscription recevied value: 1
 Merge: subscription recevied value: 2
 Merge: subscription recevied value: 3
 Merge: subscription recevied value: 4
 Merge: subscription recevied value: 5
 Merge: subscription recevied value: 300
 Merge: subscription recevied value: 400
 Merge: subscription recevied value: 500
 */


//: [Next](@next)
