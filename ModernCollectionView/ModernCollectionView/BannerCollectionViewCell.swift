//
//  BannerCollectionViewCell.swift
//  ModernCollectionView
//
//  Created by Deokhun KIM on 2023/08/31.
//

import UIKit
import SnapKit
import Kingfisher

class BannerCollectionViewCell: UICollectionViewCell {
    static let id = "BannerCell"
    let titleLabel = UILabel()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setUI()
    }
    
    private func setUI() {
        //snapkit
        self.addSubview(backgroundImage)
        self.addSubview(titleLabel)
        
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
        let url = URL(string: imageUrl)
        backgroundImage.kf.setImage(with: url)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
