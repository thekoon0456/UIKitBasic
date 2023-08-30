//
//  ViewController.swift
//  ModernCollectionView
//
//  Created by Deokhun KIM on 2023/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        setDataSource()
        setSnapShot()
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            
//            cell.config(title: <#T##String#>, imageUrl: <#T##String#>)
            return cell
        })
    }
    
    private func setSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        //snapshot에 Section과 Item 넣음
        snapshot.appendSections([Section(id: "Banner")]) //스냅샷에 같은 섹션은 하나만 넣을 수 있음, 같은 섹션 쓰려면 id 다르게 구현하기
        let bannerItems = [
            Item.banner(HomeItem(title: "교촌치킨",
                                 imageUrl: "https://thumb.mt.co.kr/06/2022/07/2022071713225256537_1.jpg/dims/optimize/")),
            Item.banner(HomeItem(title: "굽네치킨",
                                 imageUrl: "https://thumb.mt.co.kr/06/2022/07/2022071713225256537_1.jpg/dims/optimize/")),
            Item.banner(HomeItem(title: "푸라닭치킨",
                                 imageUrl: "https://thumb.mt.co.kr/06/2022/07/2022071713225256537_1.jpg/dims/optimize/"))
        
        ]
        
        snapshot.appendItems(bannerItems, toSection: Section(id: "Banner")) //아이템의 섹션 특정지어서 넣을 수 있음
        
        dataSource?.apply(snapshot)
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            
            return self?.createBannerSection()
        })
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200)) //전체비율, 높이 절대값 200
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }

}

