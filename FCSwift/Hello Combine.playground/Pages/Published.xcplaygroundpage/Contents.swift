//: [Previous](@previous)

import Foundation
import UIKit
import Combine

/*
 # @Published (Publisher)

 - `@Published` 로 선언된 프로퍼티를 퍼블리셔로 만들어줌
 - 클래스에 한해서 사용됨 (구조체에서 사용안됨)
 - `$` 를 이용해서 퍼블리셔에 접근할수 있음
 */

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Label {
    var text: String = ""
}

let lable = Label()
let vm = SomeViewModel()
print("text: \(lable.text)") //text:

vm.$name.assign(to: \.text, on: lable) //publisher에서 보낸 데이터를 lable의 text에 할당함. 이후에 변경될때마다 값 전해줌
print("text: \(lable.text)") //text: Jack

vm.name = "Jason" //이름을 바꾸면 다시 할당함
print("text: \(lable.text)") //text: Jason

vm.name = "Hoo" //이름을 바꾸면 다시 할당함
print("text: \(lable.text)") //text: Hoo


//: [Next](@next)
