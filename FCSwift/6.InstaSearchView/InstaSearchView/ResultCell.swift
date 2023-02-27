//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by Deokhun KIM on 2023/02/27.
//

import UIKit

class ResultCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //셀 재사용 전에 준비하는 기존 함수
    override func prepareForReuse() {
        super.prepareForReuse()
        //재사용될때 기존 이미지 리셋해주기.
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
