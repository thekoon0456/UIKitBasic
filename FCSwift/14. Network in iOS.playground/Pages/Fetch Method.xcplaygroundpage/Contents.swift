//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
  case invalidRequest
  case transportError(Error)
  case responseError(statusCode: Int)
  case noData
  case decodingError(Error)
}

struct GithubProfile: Codable {
    let login: String
    let avatarUrl: String
    let htmlUrl: String
    let followers: Int
    let following: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case followers
        case following
    }
}

final class NetworkService {
    let session: URLSession //네트워크 주요 객체
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    //서버에서 데이터 가져옴
    func fetchProfile(userName: String, completion: @escaping (Result<GithubProfile, Error>) -> Void) { //(=fetch: 데이터 땡겨오다, Result 타입으로 반환: enum타입, 성공, 실패 케이스가 있다. 성공케이스에는 GithubProfile 넘겨주고, 실패시 Error 넘겨줌
        let url = URL(string: "https://api.github.com/users/\(userName)")! //userName로 사용자 누구라도 검색되도록

        let task = session.dataTask(with: url) { data, response, error in //요청한 데이터, 서버로부터의 응답, 에러
            
            //네트워크 간에 에러가 없는지
            if let error = error {
                completion(.failure(NetworkError.transportError(error))) //위에 선언한 network에러 받아옴
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
                  !(200..<300).contains(httpResponse.statusCode) {
                completion(.failure(NetworkError.responseError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData)) //데이터가 없는 경우
                return
            }
            
            //data -> GithubProfile
            do {
                let decoder = JSONDecoder()
                let profile = try decoder.decode(GithubProfile.self, from: data) //앱에서 사용할수 있도록 디코딩, 디코딩이 실패할수도 있으므로 트라이 사용
                completion(.success(profile))
            } catch let error as NSError { //디코딩 과정에서 문제있으면 catch구문으로 빠짐
                completion(.failure(NetworkError.decodingError(error)))
            }
        }
        task.resume() //task 실행
    }
}

//network 담당 NetworkService
//NetworkService 이용한 네트워크 작업

let networkService = NetworkService(configuration: .default)

networkService.fetchProfile(userName: "thekoon0456") { result in //result는 enum타입: .success, .failure
    switch result {
    case .success(let profile):
        print("profile: \(profile)")
    case .failure(let error):
        print("Error: \(error)")
    }
}




//: [Next](@next)
