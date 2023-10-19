import UIKit

//1. 클로저
//실행 가능한 코드 블럭
//따지고 보면 클로저 안에 함수가 포함되는 더 큰 개념 (함수가 이름있는 클로저)
//aka 익명함수
//클로저는 함수!!!!

//ex: UIKit Label만들기
//클로저 선언과 동시에 실행해서 만들어진 label을 변수 myLabel에 담음
//UIKit을 코드베이스로 하게 되면 수천번 칠 코드
let myLabel: UILabel = {
    let label = UILabel()
    label.text = "즐거운 함수 강의"
    return label
}()


//2. 클로저 축약형
//FM
var 클로저1: (Int, Int) -> (Int) = { (first: Int, second: Int) -> Int in
    return first + second
}

//리턴 타입을 알기 때문에 리턴 타입 생략 가능
var 클로저2: (Int, Int) -> (Int) = { (first: Int, second: Int) in
    return first + second
}

//인풋 타입을 알기 때문에 인풋 타입 생략 가능
var 클로저3: (Int, Int) -> (Int) = { first, second in
    return first + second
}

////함수 한줄일때 리턴 생략 가능
var 클로저4: (Int, Int) -> (Int) = { first, second in
    first + second
}

//첫번째 인자, 두번째 인자를 $0, $1으로 축약표기 가능
var 클로저5: (Int, Int) -> (Int) = {
    $0 + $1
}

// 한 줄로
var 클로저6: (Int, Int) -> (Int) = { $0 + $1 }



//3. 후행 클로저
//진짜 진짜 많이 씀!!
//보통 함수의 마지막 인자값이 클로저일때 사용
//ex) SwiftUI의 Button { }, onChange { } 등등...
func 클로저인자함수(input: Int, closure: (Int) -> ()) {
    closure(input)
}

//후행클로저 안쓰면 파라미터 안에 클로저 다 써줘야됨
클로저인자함수(input: 1, closure: { i in
    print("후행클로저 안쓴 모습")
})

//후행클로저 사용해서 편리하게 사용 (Button, onChange...)
클로저인자함수(input: 1) { i in
    print("후행클로저 값: \(i)")
}


//질문: 클로저가 여러개일때는?
func 후행클로저3개함수(
    input1: () -> (),
    input2: () -> (),
    input3: () -> ()
) {
    print("후행클로저3개함수 실행")
}

////처음인자 생략, 두번째부터 인자 이름 나오는 방식으로 사용
후행클로저3개함수 {
    
} input2: {
    
} input3: {
    
}






//4. 이스케이핑 클로저: 클로저의 꽃, 비동기 함수 (자세한 원리는 준영센세께..!)
//클로저 중에 이런게 있다 소개만 하는 거니 가볍게 봐주세요.
//클로저가 함수의 범위를 벗어나(escaping) 다른 곳에서 실행될 때 사용됩니다.
//함수 실행이 종료되면 다 사라짐, 같이 사라지면 나중에 못씀
//이스케이핑 클로저 쓰면 실행흐름을 벗어나(탈출) 나중에 실행가능
//함수가 끝난 이후에도 사용가능

//동기: 작업이 끝날때까지 다음 작업 기다림
//비동기: 작업이 끝나든 말든 다음 작업 실행 -> 실제 작업이 언제 끝나는지 어떻게 알지? -> completionHandler 사용 (작업 종료시 항상 호출되어야 함)

//a를 곱해서 나오는 값을 리턴받아 프린트하는 함수
//동기함수로 실행하면 오래걸리는 작업이 끝나기 전에 다음 줄을 실행하고, 그 값이 리턴됨
func 잘못된비동기함수(input: Int) -> Int {
    var a = input * 2
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        a = a * 2
        print("잘못된비동기함수 첫번째 *2: \(a)")
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
        a = a * 2
        print("잘못된비동기함수 두번째 *2: \(a)")
    }
    
    return a
}

let 잘못된비동기함수리턴값 = 잘못된비동기함수(input: 1)
print("잘못된비동기함수 값:\(잘못된비동기함수리턴값)") //8이 나오게하고싶은데 2가 나옴




//오래 걸리는 작업이 다 완료된 뒤에 (completion), 그 값을 사용
//비동기 작업의 완료시점을 잡아서 실행
func 비동기함수(input: Int, completion: @escaping (Int) -> Void) -> Void { //리턴은 Void!!!
    var a = input * 2
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        a = a * 2
        print("비동기함수 첫번째 *2: \(a)") //4
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
        a = a * 2
        print("비동기함수 두번째 *2: \(a)") //8
        completion(a) //여기서 작업이 끝난 8을 클로저로 전달
    }
    
    return
}

비동기함수(input: 1) { a in //a에 8이 들어옴
    print("비동기함수 값: \(a)") //8
}


