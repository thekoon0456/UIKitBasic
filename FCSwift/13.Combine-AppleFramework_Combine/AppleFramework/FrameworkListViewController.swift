//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by Deokhun KIM on 2023/03/03.
//

import UIKit
import Combine

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    //Combine
    var subscriptions = Set<AnyCancellable>() //빈 구독자 셋 만들기
    let didSelect = PassthroughSubject<AppleFramework, Never>() //선택되었을때 선택된거를 인지하고 그에 맞춰서 화면을 띄움
    let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)
//    @Published var list: [AppleFramework] = AppleFramework.list //퍼블리시드: var 사용 /Published보다는 Subject쓰는 경우도 많음
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CollectionView Presentation, Lauout 설정해주는것
        //CollectionView 그리는데 필요한 데이터 설정해주는것
        
        configureCollectionView()
        bind() //페이지 인풋, 아웃풋 처리

    }
    private func bind() { //컴바인 이용해서 중요 로직 한곳에 모음, input/output작성
        //input: 사용자 input을 받아서 처리해야할것
        //item 선택되었을때 처리
        didSelect
            .receive(on: RunLoop.main) //UI변경이니까 메인스레드에서
            .sink{[unowned self] framework in
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
                vc.framework.send(framework)
            present(vc, animated: true)
        }.store(in: &subscriptions) //구독자 생겼을때 subscriptions에 넣기
        
        
        //output: data, state 변경에 따라서 UI 업데이트 할것
        //items가 세팅이 되었을때 컬렉션뷰를 업데이트 (컬렉션뷰에 필요한 데이터 전달하기)
        items
            .receive(on: RunLoop.main)
            .sink { [unowned self]list in
            applySectionItems(list)
        }.store(in: &subscriptions)
    }
    
    private func applySectionItems(_ items: [Item], to section: Section = .main) { //아이템 받아서 섹션에 적용하겠다. 디폴트는 메인
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    private func configureCollectionView() {
        // presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        // layer
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 10
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.33))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemLayout, count:   3)
        groupLayout.interItemSpacing = .fixed(spacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = spacing
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = items.value[indexPath.item]
        print(">>> selected: \(framework.name)")
        didSelect.send(framework)
    }
}
