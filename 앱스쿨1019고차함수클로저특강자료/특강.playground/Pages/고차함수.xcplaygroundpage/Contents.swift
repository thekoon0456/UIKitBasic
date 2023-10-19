import Foundation
//고차함수
//메개변수로 함수를 갖는 함수

//컬렉션을 받아서 클로저 내부에서 이 데이터를 가공해서 반환한다

let 함수예제배열: [Int] = [1, 2, 3, 4]

let 함수: (Int) -> Int = { number in
    return number * 2
}

let 고차함수예시 = 함수예제배열.map(함수) //함수 map의 인자로 함수를 넣음 (고차함수)
print(고차함수예시) //[2, 4, 6, 8]

//1. foreach
//컬렉션을 순회
함수예제배열.forEach { i in
    print(i)
}

//func customForEach<T>(_ array: [T], action: (T) -> Void) {
//    for element in array {
//        action(element)
//    }
//}




//2. sorted
//컬렉션을 정렬
let sorted결과 = 함수예제배열.sorted { first, second in
    return first > second
}

//let sorted결과 = 함수예제배열.sorted(by: >)
print(sorted결과)


//func customSorted<T: Comparable>(_ array: [T]) -> [T] {
//    var sortedArray = array
//    for i in 0..<sortedArray.count {
//        for j in i+1..<sortedArray.count {
//            if sortedArray[i] > sortedArray[j] {
//                sortedArray.swapAt(i, j)
//            }
//        }
//    }
//    return sortedArray
//}




//3. map
//하나씩 돌면서 변환하고 리턴해줌
let map결과 = 함수예제배열.map { i in
    return i * 2
}

//let map결과 = 함수예제배열.map { $0 * 2 }
print(map결과)

//func customMap<T, U>(_ array: [T], transform: (T) -> U) -> [U] {
//    var result = [U]()
//    for element in array {
//        result.append(transform(element))
//    }
//    return result
//}



//딕셔너리를 고차함수로 돌리면 튜플 배열로 반환함
let 딕셔너리: [String: String] = ["태영": "스쿨", "덕훈": "스쿨"]
let 딕셔너리map = 딕셔너리.map { $0 }
print(딕셔너리map) //[(key: "덕훈", value: "스쿨"), (key: "태영", value: "스쿨")]




//4. filter
//조건에 맞춰서 필터링해줌 (조건은 Bool!)
let filter결과 = 함수예제배열.filter { i in
    return i % 2 == 0
}

//let filter결과 = 함수예제배열.filter { $0 % 2 == 0 }
print(filter결과)

//func customFilter<T>(_ array: [T], isIncluded: (T) -> Bool) -> [T] {
//    var result = [T]()
//    for element in array {
//        if isIncluded(element) {
//            result.append(element)
//        }
//    }
//    return result
//}




//5. reduce
//합쳐줌
let reduce결과 = 함수예제배열.reduce(0) { first, second in
    return first + second
}

//let reduce결과 = 함수예제배열.reduce(0) { $0 + $1 }
print(reduce결과)

//Character타입도 String으로 reduce()가능
let 캐릭터배열 = ["앱", "스", "쿨", "3", "기"]
let reducedStr = 캐릭터배열.reduce("") { $0 + $1 }
print(reducedStr)


//func customReduce<T, U>(_ array: [T], _ initialResult: U, _ nextPartialResult: (U, T) -> U) -> U {
//    var result = initialResult
//    for element in array {
//        result = nextPartialResult(result, element)
//    }
//    return result
//}

