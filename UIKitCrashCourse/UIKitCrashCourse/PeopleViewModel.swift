//
//  PeopleViewModel.swift
//  UIKitCrashCourse
//
//  Created by Deokhun KIM on 2023/03/09.
//

import Foundation

protocol PeopleViewModelDelegate: AnyObject { //뷰와 통신하는 delegate 프로토콜 생성
    func didFinish()
    func didFail(error: Error)
}

class PeopleViewModel {
    
    private(set) var people = [PersonResponse]() //set만 외부에서 못하도록 private(set)으로 설정
    
    weak var delegate: PeopleViewModelDelegate?
    
    @MainActor //메인스레드에서 실행
    func getUsers() {
        
        Task { [weak self] in
            
            do {
                
                let url = URL(string: "https://reqres.in/api/users")!
                //data, response 여기서는 데이터만 사용해서 response 비움
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase //json의 snakeCase를 camelCase로
                
                self?.people = try jsonDecoder.decode(UserResponse.self, from: data).data //(UserResponse로 decoding, data를)
                self?.delegate?.didFinish()
            } catch {
                
                self?.delegate?.didFail(error: error)
                
            }
        }
    }
}
