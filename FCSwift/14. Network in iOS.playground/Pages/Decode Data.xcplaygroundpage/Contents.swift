//: [Previous](@previous)

import Foundation


struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey { //JSON 속성들 키값
        case login
        case avatarUrl = "avatar_url" //JSON에는 언더바가 있어서 호환할 수 있도록 CodingKey사용 (서버에서는 snake_case를 사용하는 경우가 많음)
        case htmlUrl = "html_url"
        case followers
        case following
    }
}


//App model -> JSON : Encoding
//App model <- JSON : Decoding //키를 프로퍼티와 매핑해서 데이터 넣음, 스위프트는 camelCase, 서버데이터는 snake_case로 매칭이 안되므로 enum CodingKeys 사용해 매칭

let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/thekoon0456")!

let task = session.dataTask(with: url) { data, response, error in //요청한 데이터, 서버로부터의 응답, 에러
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode) else {
        print("--> response \(response)")
        return
    }
    guard let data = data else {return}
    //data -> GithubProfile
    do {
        let decoder = JSONDecoder()
        let profile = try decoder.decode(GithubProfile.self, from: data) //서버에서 받은 data를 앱에서 사용할수 있도록 디코딩, 디코딩이 실패할수도 있으므로 트라이 사용
        print("profile: \(profile)")
    } catch let error as NSError { //디코딩 과정에서 문제있으면 catch구문으로 빠짐
        print("error: \(error)")
    }
//    let result = String(data: data, encoding: .utf8)
//    print(result)
}

task.resume()



//: [Next](@next)
