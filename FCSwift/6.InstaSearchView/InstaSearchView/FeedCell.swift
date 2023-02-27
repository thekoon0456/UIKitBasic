//
//  FeedCell.swift
//  InstaSearchView
//
//  Created by Deokhun KIM on 2023/02/27.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
