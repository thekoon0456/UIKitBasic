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
    private let tvNerwork: TVNetwork
    private let movieNetwork: MovieNetwork
    
    init() {
        let provider = NetworkProvider()
        tvNerwork = provider.makeTVNetwork()
        movieNetwork = provider.makeMovieNetwork()
    }
    
    //뷰컨 -> 뷰모델
    struct Input {
        let tvTrigger: Observable<Void>
        let movieTrigger: Observable<Void>
    }
    
    //뷰모델 -> 뷰컨
    struct Output {
        let tvList: Observable<[Tv]>
        let movieResult: Observable<MovieResult>
    }
    
    func transform(input: Input) -> Output {
        
        //trigger -> 네트워크 -> Observable<T> -> VC전달 -> VC에서 구독
        
        //tvTrigger -> Observable<Void> -> Observable<[Tv]>
        let tvList = input.tvTrigger.flatMapLatest { [weak self] _ -> Observable<[Tv]> in
            //Observable<TvListModel> -> Observable<[Tv]>
            guard let self = self else { return Observable.empty() }
            return self.tvNerwork.getTopRatedList().map { $0.results }
        }
        
        let movieResult = input.movieTrigger.flatMapLatest { [weak self] _ -> Observable<MovieResult> in
            //3개의 옵저버블 합치기 combineLatest
            //3개 모두 리턴이 있어야 해당 클로저 발동함
            guard let self = self else { return Observable.empty() }
            return Observable.combineLatest(self.movieNetwork.getUpcomingList(),
                                            self.movieNetwork.getPopularList(),
                                            self.movieNetwork.getNowPlayingList()) { upcoming, popular, nowPlaying -> MovieResult in
                return MovieResult(upcoming: upcoming, popular: popular, nowPlaying: nowPlaying)
            }
        }
        
        return Output(tvList: tvList, movieResult: movieResult)
    }
}
