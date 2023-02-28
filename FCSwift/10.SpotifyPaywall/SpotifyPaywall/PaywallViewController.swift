//
//  PaywallViewController.swift
//  SpotifyPaywall
//
//  Created by Deokhun KIM on 2023/02/28.
//

import UIKit

// https://developer.spotify.com/documentation/general/design-and-branding/#using-our-logo
// https://developer.apple.com/documentation/uikit/nscollectionlayoutsectionvisibleitemsinvalidationhandler
// 애플 샘플 코드: https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views

class PaywallViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerInfo: [BannerInfo] = BannerInfo.list
    //카드 배경색
    let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    typealias Item = BannerInfo
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //presentation: diffableDatasource
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            cell.configure(item)
            cell.backgroundColor = self.colors[indexPath.item]
            return cell
        })
        
        //data: snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfo, toSection: .main)
        dataSource.apply(snapshot)
        
        //layout: compotional layout
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false //버티컬로 스크롤 안되도록
        pageControl.numberOfPages = bannerInfo.count
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging //페이징됨   //.continuous: 가로스크롤
        section.interGroupSpacing = 20 //그룹간 간격
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up)) //소수점 자리 업
            self.pageControl.currentPage = index
        }
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    
}
