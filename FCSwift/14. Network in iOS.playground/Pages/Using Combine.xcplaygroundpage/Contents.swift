//: [Previous](@previous)

import Foundation
import Combine

enum NetworkError: Error {
    case invalidRequest
    case responseError(statusCode: Int)
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
    func fetchProfile(userName: String) -> AnyPublisher<GithubProfile, Error> { //(=fetch: 데이터 땡겨오다, 퍼블리셔에서 데이터타입: GithubProfile, 에러타입: Error
        let url = URL(string: "https://api.github.com/users/\(userName)")! //userName로 사용자 누구라도 검색되도록
        
        let publisher = session
            .dataTaskPublisher(for: url)
        //서버에서 받은 response 확인 및 Data 확인
            .tryMap { result -> Data in
                guard  let httpResponse = result.response as? HTTPURLResponse,
                        (200..<300).contains(httpResponse.statusCode) else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }  //받은 Data 디코딩 잘하기
            .decode(type: GithubProfile.self, decoder: JSONDecoder()) //operator에 .decode 사용
            .eraseToAnyPublisher() //typeErasing. 타입 지우는 역할
        return publisher
    }
}

let networkService = NetworkService(configuration: .default)

let subscription = networkService
    .fetchProfile(userName: "thekoon0456")
    .receive(on: RunLoop.main)
    .print()
    .sink { complition in
        print("complition: \(complition)")
    } receiveValue: { profile in
        print("profile: \(profile)")
    }





//: [Next](@next)



