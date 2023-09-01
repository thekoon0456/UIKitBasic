//
//  TVNetwork.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import Foundation
import RxSwift

final class TVNetwork {
    private let network: Network<TvListModel>
    
    init(network: Network<TvListModel>) {
        self.network = network
    }
    
    func getTopRatedList() -> Observable<TvListModel> {
        return network.getItemList(path: "/tv/top_rated")
    }
}

//endpoint = "https://api.themoviedb.org/3\(path)"
