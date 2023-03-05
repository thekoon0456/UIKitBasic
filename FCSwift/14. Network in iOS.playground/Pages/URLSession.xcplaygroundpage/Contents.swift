//: [Previous](@previous)

import Foundation

// configuration -> urlsession -> urlsessionTask

let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/thekoon0456")!

let task = session.dataTask(with: url) { data, response, error in //요청한 데이터, 서버로부터의 응답, 에러
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print("--> response \(response)")
        return
    }
    guard let data = data else { return }
    
    let result = String(data: data, encoding: .utf8)
    print(result)
}

task.resume() //resume해야 시작함



//: [Next](@next)
