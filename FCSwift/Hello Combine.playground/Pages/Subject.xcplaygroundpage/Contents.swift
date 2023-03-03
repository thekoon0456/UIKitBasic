import Foundation
import Combine

/*
 # Subject (Publisher)

 - `send(_:)`  메소드를 이용해서 이벤트 값을 주입시킬수 있는 퍼블리셔
 - 기존의 비동기처리 방식에서 Combine으로 전환시 유용함
 - 2가지 빌트인 타입이 있음
     - `PassthroughSubject`
         - Subcriber가 달라고 요청하면,
         - 그때 부터, 받은 값을 전달해주기만 함
         - 전달한 값을 들고 있지 않음
     - `CurrentValueSubject`
         - Subcriber가 달라고 요청하면,
         - 최근에 가지고 있던 값을 전달하고, 그때 부터, 받은 값을 전달 함
         - 전달한 값을 들고 있음
 */

// PassthroughSubject: 데이터 패싱해서 보냄
let relay = PassthroughSubject<String, Never>() //퍼블리셔<아웃풋 타입,error타입> /Never: 실패 안함
let subscription1 = relay.sink { value in
    print("Subscription1 received value: \(value)") //값이 들어올때마다 sink됨
}

//send메소드로 데이터보냄
relay.send("Hello")
relay.send("World!")
/* PassthroughSubject: 데이터 패싱해서 보냄
 Subscription1 received value: Hello
 Subscription1 received value: World!
 */


// CurrentValueSubject
let variable = CurrentValueSubject<String, Never>("") //CurrentValueSubject: <String, Never>(괄호에 output의 초기값을 넣어줘야 함!(기존에 가지고 있는 데이터 한번 보냄))
let subscription2 = variable.sink { value in
    print("Subscription2 received value: \(value)")
}

variable.send("More text")
/* CurrentValueSubject: 기존에 초기값을 하나 보내고, 새로 주입받은 데이터를 보냄
 Subscription2 received value:
 Subscription2 received value: More text
 */
variable.value //"More text", .value: 현재 가지고 있는 데이터 볼 수 있음


// CurrentValueSubject 2
let variable1 = CurrentValueSubject<String, Never>("")

variable1.send("Initial text")

let subscription3 = variable1.sink { value in
    print("Subscription3 received value: \(value)")
}

variable1.send("More text")
/* subscription 하기 직전의 variable1의 데이터가 Initial text이었으므로, 이 값과 다음 주입받은 값을 받음
 Subscription3 received value: Initial text
 Subscription3 received value: More text
 */


let publisher = ["Here", "we", "go"].publisher
publisher.subscribe(relay) //publisher가 배출한 데이터가 relay에 전달됨
/*
 relay.send("Here")
 relay.send("we")
 relay.send("go")
 */
//와 같은 효과임.
/*
 Subscription1 received value: Here
 Subscription1 received value: we
 Subscription1 received value: go
 */
