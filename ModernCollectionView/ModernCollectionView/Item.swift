//
//  Item.swift
//  ModernCollectionView
//
//  Created by Deokhun KIM on 2023/08/31.
//

import Foundation

//섹션과 아이템 정의

struct Section: Hashable {
    let id: String
}

enum Item: Hashable {
    case banner(HomeItem)
    case normalCarousel(HomeItem)
    case listCarousel(HomeItem)
}

struct HomeItem: Hashable {
    let title: String
    let subTitle: String?
    let imageUrl: String
    
    init(title: String, subTitle: String? = "" ,imageUrl: String) {
        self.title = title
        self.subTitle = subTitle
        self.imageUrl = imageUrl
    }
}

//컬렉션뷰 cell UI - 등록
//레이아웃 구현 - 3가지
//datasource - cellProvider - 해당 데이터에 알맞는 셀 리턴
//snapshot -> datasource.apply(snapshot)
