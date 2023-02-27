//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    //diffable datasource-데이터 소스 만듬[Section[item]] 여러개이므로 정의해줘야됨
    //  var dataSource: UICollectionViewDiffableDataSource<Section, AppleFramework>!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>! //(섹션 넣고, 아이템 넣고) 밑에 적어주면 직관적이고 깔끔하게 정리 하능
    
    typealias Item = AppleFramework //애플프레임워크 아이템 씀, typealias(리다이렉팅) 사용하면 아이템을 애플프레임워크처럼 쓸 수 있음
    enum Section { //enum자체가 hashable함.
        case main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Presentation, Data, Layout
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in //두번째 클로저 엔터치면 자동으로 나옴 == let data = datalist[indexPath.item]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
         
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>() //어떤 섹션에 어떤 아이템 넣을것인지
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main) //list를 main에 넣을거야
        dataSource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        /*
        diffable datasource: presentation,
        snapshot: data
        compositional Layout: Layout */
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        //아이템 사이즈: fractionalWidth: 스크린 할당된 화면에서 0.33(1/3)로, 높이는 1로 그룹 높이와 같게
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        //그룹의 너비는 섹션의 너비와 같게, 높이는 너비의 1/3로 써라
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitem: item, count: 3)
        //그룹의 구성: 사이즈는 위의 사이즈, 아이템은 위의 아이템 쓰고, 아이템을 3등분으로 균일하게 쓰겠다
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        //좌우에 Padding 공간 주기
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}


extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
