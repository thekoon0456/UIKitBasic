//
//  Network.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import Foundation
import RxSwift
//import RxAlamofire
import Alamofire


class Network<T: Decodable> {
    
    private let endpoint: String
    private let queue: ConcurrentDispatchQueueScheduler
    
    init(_ endpoint: String) {
        self.endpoint = endpoint
        self.queue = ConcurrentDispatchQueueScheduler(qos: .background)
    }
    
    //네트워크 요청, 결과를 Observable로 반환
    func getItemList(path: String) -> Observable<T> {
        let fullPath = "\(endpoint)\(path)?api_key=\(APIKEY)&language=ko"
        
        return Observable.create { observer -> Disposable in
            AF.request(fullPath, method: .get, encoding: JSONEncoding.default)
                .responseData { response in
                    print("statusCode: \(response.response?.statusCode)")
                    switch response.result {
                    case .success(let data):
                        print(data)
                        observer.onNext(data)
                    case .failure(let error):
                        observer.onError(error)
                    }
                }
            
            return Disposables.create()
        }
        .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
        .map { data -> T in //map으로 받아온 데이터를 디코딩.
            let resultData = try JSONDecoder().decode(T.self, from: data)
            print(resultData)
            return resultData
        }
        .take(1)
    }
}
