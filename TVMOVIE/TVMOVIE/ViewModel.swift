//
//  ViewModel.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/02.
//

import Foundation
import RxSwift

class ViewModel {
    let disposeBag = DisposeBag()
    
    //뷰컨 -> 뷰모델
    struct Input {
        let tvTrigger: Observable<Void>
        let movieTrigger: Observable<Void>
    }
    
    //뷰모델 -> 뷰컨
    struct Output {
        let tvList: Observable<[Tv]>
//        let movieList: Observable<MovieResult>
    }
    
    func transform(input: Input) -> Output {
        input.tvTrigger.bind { _ in
            print("trigger")
        }.disposed(by: disposeBag)
        return Output(tvList: Observable<[Tv]>.just([]))
    }
}
