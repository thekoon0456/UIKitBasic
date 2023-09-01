//
//  Network.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import Foundation
import RxSwift
import RxAlamofire


class Network<T: Decodable> {
    
    private let endpoint: String
    private let queue: ConcurrentDispatchQueueScheduler
    
    init(_ endpoint: String) {
        self.endpoint = endpoint
        self.queue = ConcurrentDispatchQueueScheduler(qos: .background)
    }
    
    func getItemList(path: String) -> Observable<T> {
        let fullPath = "\(endpoint)\(path)?api_key=\(APIKEY)&language=ko"
        return RxAlamofire.data(.get, fullPath)
            .observe(on: queue) //백그라운드큐에서 작업
            .debug() //데이터 과정 콘솔에 프린트
            .map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }
    }
    
}
