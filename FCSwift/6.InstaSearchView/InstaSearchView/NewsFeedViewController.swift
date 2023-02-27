//
//  NewsFeedViewController.swift
//  InstaSearchView
//
//  Created by Deokhun KIM on 2023/02/27.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Data, Presentation, Layout
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowLayOut = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayOut.estimatedItemSize = .zero
        }
    }

}

extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as? FeedCell else {
            return UICollectionViewListCell()
        }

        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let height = width * 3/4 + 60 //4:3하고 위에 프로필 간격까지 포함하도록
        
        return CGSize(width: width, height: height)
    }
}
