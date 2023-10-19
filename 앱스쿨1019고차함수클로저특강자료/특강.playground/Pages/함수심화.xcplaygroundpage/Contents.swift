import Foundation
//1. 함수심화

//1. 전달인자레이블 (argumentLabel)
//함수 내부, 외부에서 파라미터 이름을 다르게 한다
//함수 호출시 매개변수의 역할을 좀 더 명확하게 알 수 있다.
var 변수1 = "멋쟁이"
var 변수2 = "사자처럼"

//_ 와일드카드 식별자. 함수 호출시 파라미터 생략가능
func printLikeLion(_ first: String, plus second: String) {
    print("전달인자레이블 함수: \(first)\(second)")
}

//전달인자 레이블을 사용하면 오버로딩 가능(함수 중복 정의 가능) (같은 이름의 함수 여러 개 사용가능)
//ex) UIButton
func printLikeLion(first: String, second: String) {
    print("오버로딩 함수, \(first)\(second)")
}

//같은 함수 이름, 다양한 기능 구현 가능
printLikeLion(변수1, plus: 변수2)
printLikeLion(first: 변수1, second: 변수2)

//애플이 미리 수없이 많이 만들어놓음
//Button



//2. inout
//함수 내부에서 사용하는 파라미터는 기본적으로 불변, 외부의 값을 복사해서 사용한다.
//inout은 참조로 직접 값을 바꾼다.
//inout을 사용하는 타입임을 알려주기 위한 키워드
//함수 사용시에 &사용

func inoutLikeLion(first: inout String, second: inout String) {
    first = "앱스쿨"
    second = "3기"
}

inoutLikeLion(first: &변수1, second: &변수2)
print("\(변수1)\(변수2)")



