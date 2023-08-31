//
//  ViewController.swift
//  ModernCollectionView
//
//  Created by Deokhun KIM on 2023/08/30.
//

import UIKit

class ViewController: UIViewController {
    let imageUrl = "https://thumb.mt.co.kr/06/2022/07/2022071713225256537_1.jpg/dims/optimize/"
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        collectionView.register(NormalCarouselCollectionViewCell.self, forCellWithReuseIdentifier: NormalCarouselCollectionViewCell.id)
        collectionView.register(ListCarouselCollectionViewCell.self, forCellWithReuseIdentifier: ListCarouselCollectionViewCell.id)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        
        setDataSource()
        setSnapShot()
    }
    
    private func setUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            switch itemIdentifier {
            case .banner(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
                
                cell.config(title: item.title, imageUrl: item.imageUrl)
                return cell
            case .normalCarousel(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCarouselCollectionViewCell.id, for: indexPath) as? NormalCarouselCollectionViewCell else { return UICollectionViewCell() }
                
                cell.config(imageUrl: item.imageUrl, title: item.title, subTitle: item.subTitle ?? "")
                return cell
            case .listCarousel(let item):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCarouselCollectionViewCell.id, for: indexPath) as? ListCarouselCollectionViewCell else { return UICollectionViewCell() }
                
                cell.config(imageUrl: item.imageUrl, title: item.title, subTitle: item.subTitle ?? "")
                return cell
            }
        })
    }
    
    private func setSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        //snapshot에 Section과 Item 넣음
        snapshot.appendSections([Section(id: "Banner")]) //스냅샷에 같은 섹션은 하나만 넣을 수 있음, 같은 섹션 쓰려면 id 다르게 구현하기
        let bannerItems = [
            Item.banner(HomeItem(title: "교촌치킨",
                                 imageUrl: imageUrl)),
            Item.banner(HomeItem(title: "굽네치킨",
                                 imageUrl: imageUrl)),
            Item.banner(HomeItem(title: "푸라닭치킨",
                                 imageUrl: imageUrl))
        ]
        snapshot.appendItems(bannerItems, toSection: Section(id: "Banner")) //아이템의 섹션 특정지어서 넣을 수 있음
        
        let normalSection = Section(id: "NormalCarousel")
        snapshot.appendSections([normalSection])
        let normalItems = [
            Item.normalCarousel(HomeItem(title: "교촌치킨", subTitle: "간장 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "굽네치킨", subTitle: "오븐 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "푸라닭치킨", subTitle: "차이니즈 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "후라이드 참 잘하는집", subTitle: "후라이드 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "페리카나", subTitle: "반반 치킨", imageUrl: imageUrl)),
            Item.normalCarousel(HomeItem(title: "BHC", subTitle: "뿌링클 치킨", imageUrl: imageUrl))
        ]
        snapshot.appendItems(normalItems, toSection: normalSection)
        
        let listSection = Section(id: "ListCarousel")
        snapshot.appendSections([listSection])
        let listItems = [
            Item.listCarousel(HomeItem(title: "교촌치킨", subTitle: "간장 치킨", imageUrl: imageUrl)),
            Item.listCarousel(HomeItem(title: "굽네치킨", subTitle: "오븐 치킨", imageUrl: imageUrl)),
            Item.listCarousel(HomeItem(title: "푸라닭치킨", subTitle: "차이니즈 치킨", imageUrl: imageUrl)),
            Item.listCarousel(HomeItem(title: "후라이드 참 잘하는집", subTitle: "후라이드 치킨", imageUrl: imageUrl)),
            Item.listCarousel(HomeItem(title: "페리카나", subTitle: "반반 치킨", imageUrl: imageUrl)),
            Item.listCarousel(HomeItem(title: "BHC", subTitle: "뿌링클 치킨", imageUrl: imageUrl))
        ]
        snapshot.appendItems(listItems, toSection: listSection)
        
        dataSource?.apply(snapshot)
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 30
        
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self?.createBannerSection()
            case 1:
                return self?.createNormalCarouselSection()
            case 2:
                return self?.createListCarouselSection()
            default:
                return self?.createBannerSection()
            }
        }, configuration: config)
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
    
    private func createNormalCarouselSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    private func createListCarouselSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

}

