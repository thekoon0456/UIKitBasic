//
//  BannerCollectionViewCell.swift
//  ModernCollectionView
//
//  Created by Deokhun KIM on 2023/08/31.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    static let id = "BannerCell"
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    private func setUI() {
        //snapkit
        self.addSubview(titleLabel)
        self.addSubview(backgroundImage)
        
        //constraint적용
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    public func config(title: String, imageUrl: String) {
        //title, imageSet
        titleLabel.text = title
//        backgroundImage.image =
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
