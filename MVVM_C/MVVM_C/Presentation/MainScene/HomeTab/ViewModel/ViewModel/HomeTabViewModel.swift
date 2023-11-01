//
//  HomeTabViewModel.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import Foundation

import RxSwift

final class HomeTabViewModel {
    let disposeBag = DisposeBag()
    private let tvNerwork: TVNetwork
    
    init() {
        let provider = NetworkProvider()
        tvNerwork = provider.makeTVNetwork()
    }
    
    //뷰컨 -> 뷰모델
    struct Input {
        let tvTrigger: Observable<Void>
    }
    
    //뷰모델 -> 뷰컨
    struct Output {
        let tvList: Observable<[Tv]>
    }
    
    func transform(input: Input) -> Output {
        
        //trigger -> 네트워크 -> Observable<T> -> VC전달 -> VC에서 구독
        
        //tvTrigger -> Observable<Void> -> Observable<[Tv]>
        let tvList = input.tvTrigger.flatMapLatest { [weak self] _ -> Observable<[Tv]> in
            //Observable<TvListModel> -> Observable<[Tv]>
            guard let self = self else { return Observable.empty() }
            return tvNerwork.getTopRatedList().map { $0.results }
        }
        
        return Output(tvList: tvList)
    }
}
