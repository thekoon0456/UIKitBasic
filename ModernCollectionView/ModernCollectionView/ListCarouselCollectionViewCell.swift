//
//  ListCarouselCollectionViewCell.swift
//  ModernCollectionView
//
//  Created by Deokhun KIM on 2023/08/31.
//

import UIKit
import Kingfisher

class ListCarouselCollectionViewCell: UICollectionViewCell {
    static let id = "ListCarouselCell"
    private let mainImage = UIImageView()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    private func setUI() {
        addSubview(mainImage)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        
        mainImage.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(60)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.right.equalToSuperview()
            make.left.equalTo(mainImage.snp.right).offset(8)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(mainImage.snp.right).offset(8)
        }
    }
    
    func config(imageUrl: String, title: String, subTitle: String) {
        mainImage.kf.setImage(with: URL(string: imageUrl))
        titleLabel.text = title
        subTitleLabel.text = subTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
