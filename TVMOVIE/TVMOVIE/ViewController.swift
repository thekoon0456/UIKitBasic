//
//  ViewController.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import UIKit
import SnapKit
import RxSwift

//1섹션, 1아이템, 1레이아웃
//레이아웃 관련
enum Section: Hashable { //하나의 레이아웃 구분하는 기준
    case double //하나의 행에 cell 두개 들어감
    case banner
    case horizontal(String) //헤더
    case vertical(String)
}

//Cell 관련
enum Item: Hashable { //해당 레이아웃에 어떤 cell을 쓸지
    case normal(Content) //Tv, Movie 같이 써야함. Content에 두 개의 init() 만들어 하나의 타입으로 만들기
    case bigImage(Movie)
    case list(Movie)
}

class ViewController: UIViewController {
    let disposeBag = DisposeBag() //뷰컨 메모리 해제될때 구독 메모리도 해제. 바인딩 끝남
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>?
    let buttonView = ButtonView()
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createLayout())
        collectionView.register(NormalCollectionViewCell.self,
                                forCellWithReuseIdentifier: NormalCollectionViewCell.id)
        collectionView.register(BigImageCollectionViewCell.self,
                                forCellWithReuseIdentifier: BigImageCollectionViewCell.id)
        collectionView.register(ListCollectionViewCell.self,
                                forCellWithReuseIdentifier: ListCollectionViewCell.id)
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.id)
        return collectionView
    }()
    let viewModel = ViewModel()
    
    //Subject: 이벤트를 발생시키면서, Observable 형태도 되는거
    let tvTrigger = PublishSubject<Void>()
    let movieTrigger = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDateSource()
        bindViewModel()
        bindView()
        tvTrigger.onNext(())
    }
    
    private func setUI() {
        view.addSubview(buttonView)
        buttonView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    private func bindViewModel() { //asObservable: Subject를 Observable로 변환
        let input = ViewModel.Input(tvTrigger: tvTrigger.asObservable(),
                                    movieTrigger: movieTrigger.asObservable())
        let output = viewModel.transform(input: input)
        
        output.tvList.bind { [weak self] tvList in
            print("tvList: \(tvList)")
            var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
            let items = tvList.map { Item.normal(Content(tv: $0)) }
            let section = Section.double
            snapshot.appendSections([section])
            snapshot.appendItems(items, toSection: section)
            self?.dataSource?.apply(snapshot)
        }.disposed(by: disposeBag)
        
        output.movieResult.bind { [weak self] movieResult in
            print("movieList: \(movieResult)")
            var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
            let bigImageList = movieResult.nowPlaying.results.map { Item.bigImage($0) }
            let bannerSection = Section.banner
            snapshot.appendSections([bannerSection])
            snapshot.appendItems(bigImageList, toSection: bannerSection)
            
            let horizontalSection = Section.horizontal("PopularMovies")
            let normalList = movieResult.popular.results.map { Item.normal(Content(movie: $0)) }
            snapshot.appendSections([horizontalSection])
            snapshot.appendItems(normalList, toSection: horizontalSection)
            
            self?.dataSource?.apply(snapshot)
        }.disposed(by: disposeBag)
    }

    private func bindView() {
        buttonView.tvButton.rx.tap.bind { [weak self] in
            self?.tvTrigger.onNext(Void()) //버튼 트리거를 하기 위해 아무 값도 주지 않고 Void로 트리거 호출
        }.disposed(by: disposeBag)
        
        buttonView.movieButton.rx.tap.bind { [weak self] in
            self?.movieTrigger.onNext(Void())
        }.disposed(by: disposeBag)
    }

    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 14
        
        return UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            let section = self?.dataSource?.sectionIdentifier(for: sectionIndex)
            
            switch section {
            case .banner:
                return self?.createBannerSection()
            case .horizontal:
                return self?.createHorizontalSection()
            default:
                return self?.createSection()
            }

        }, configuration: config)
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(640))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging //페이징처럼 넘김
        return section
    }
    
    private func createHorizontalSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                               heightDimension: .absolute(320))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func createSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 8, trailing: 4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(320))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func setDateSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            switch item {
            case.normal(let contentData):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCollectionViewCell.id, for: indexPath) as? NormalCollectionViewCell
                cell?.configure(title: contentData.title, review: contentData.vote, desc: contentData.overview, imageURL: contentData.posterURL)
                return cell
                
            case .bigImage(let movieData):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigImageCollectionViewCell.id, for: indexPath) as? BigImageCollectionViewCell
                cell?.config(title: movieData.name, review: movieData.vote, overview: movieData.overview, url: movieData.posterURL)
                return cell
                
            case .list(let movieData):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.id, for: indexPath) as? ListCollectionViewCell
                cell?.config(title: movieData.name, releaseDate: movieData.releaseDate, url: movieData.posterURL)
                return cell
            }
        })
    }
}

