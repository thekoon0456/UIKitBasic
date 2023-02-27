//
//  SearchViewController.swift
//  InstaSearchView
//
//  Created by Deokhun KIM on 2023/02/27.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //레이아웃 시스템 설정 말고 내가 설정한 걸로 - estimateSize: None
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self //UISearchResultsUpdating 프로토콜 구현
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController: UICollectionViewDataSource {
    //컬렉션 셀 아이템 몇 개 필요한지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24 //이미지가 24개
    }
    
    //셀을 어떻게 표현할건지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    //컬렉션 뷰 셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 1
        let width = (collectionView.bounds.width - interItemSpacing * 2)/3
        let height = width
        return CGSize(width: width, height: height)
    }
    
    //위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("search: \(search)")
    }
}
