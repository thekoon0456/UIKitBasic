//
//  ViewController.swift
//  Today
//
//  Created by Deokhun KIM on 2023/02/23.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    //데이터소스
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    //스냅샷
    typealias SnapShot = NSDiffableDataSourceSnapshot<Int, String>
    //옵셔널에 값이 확실히 있을때만 강제언래핑 사용
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayOut()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = reminder.title
            cell.contentConfiguration = contentConfiguration
        }
        
        //재사용가능한 셀
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        //title을 snapshot항목으로 추가
        var snapshot = SnapShot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map { $0.title})
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }
    
    //list에 레이아웃 만듬
    private func listLayOut() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }


}
