//
//  MovieNetwork.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import Foundation
import RxSwift

final class MovieNetwork {
    private let network: Network<MovieListModel>
    
    init(network: Network<MovieListModel>) {
        self.network = network
    }
    
    func getNowPlayingList() -> Observable<MovieListModel> {
        return network.getItemList(path: "/movie/now_playing")
    }
    
    func getPopulerList() -> Observable<MovieListModel> {
        return network.getItemList(path: "/movie/populer")
    }
    
    func getUpcomingList() -> Observable<MovieListModel> {
        return network.getItemList(path: "/movie/upcoming")
    }
}
