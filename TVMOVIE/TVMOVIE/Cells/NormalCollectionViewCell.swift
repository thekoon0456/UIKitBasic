//
//  NormalCollectionViewCell.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/03.
//

import Foundation
import UIKit
import Kingfisher

class NormalCollectionViewCell: UICollectionViewCell {
    static let id = "NormalCollectionViewCell"
    let image: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(image)
        addSubview(titleLabel)
        addSubview(reviewLabel)
        addSubview(descLabel)
        
        image.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(image.snp.bottom).offset(8)
        }
        
        reviewLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        descLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(reviewLabel.snp.bottom).offset(8)
        }
    }
    
    public func configure(title: String, review: String, desc: String, imageURL: String) {
        image.kf.setImage(with: URL(string: imageURL))
        titleLabel.text = title
        reviewLabel.text = review
        descLabel.text = desc
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
