//
//  ListCollectionViewCell.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/03.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

final class ListCollectionViewCell: UICollectionViewCell {
    static let id = "ListCollectionViewCell"
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true //에이어가 잘려도 이미지 네모낳게 들어갈 수 있음
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        addSubview(titleLabel)
        addSubview(releaseDateLabel)
        
        image.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3) //슈퍼뷰 기준 너비에서 30%
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(8)
            make.top.equalToSuperview()
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
    }
    
    public func config(title: String, releaseDate: String, url: String) {
        titleLabel.text = title
        releaseDateLabel.text = releaseDate
        image.kf.setImage(with: URL(string: url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
