//
//  BigImageCollectionViewCell.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/03.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

final class BigImageCollectionViewCell: UICollectionViewCell {
    static let id = "BigImageCollectionViewCell"
    
    private let posterImage = UIImageView()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImage)
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(reviewLabel)
        stackView.addArrangedSubview(descLabel)
        
        posterImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(500)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(14)
            make.right.bottom.equalToSuperview().offset(-14)
        }
    }
    
    public func config(title: String, review: String, overview: String, url: String) {
        titleLabel.text = title
        reviewLabel.text = review
        descLabel.text = overview
        posterImage.kf.setImage(with: URL(string: url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
