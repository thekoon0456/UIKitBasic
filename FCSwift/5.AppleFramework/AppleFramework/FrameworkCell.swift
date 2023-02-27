//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by Deokhun KIM on 2022/07/17.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLable.numberOfLines = 1
        nameLable.adjustsFontSizeToFitWidth = true
        //폰트사이즈 셀에 따라서 조정시켜라
    }
    
    //framework 데이터 받아서 cell을 업데이트해주는 메소드 추가 (config:구성)
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        
        nameLable.text = framework.name
    }
    
}
