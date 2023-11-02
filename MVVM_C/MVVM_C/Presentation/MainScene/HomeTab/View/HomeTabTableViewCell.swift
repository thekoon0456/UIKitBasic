//
//  HomeTabTableViewCell.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 11/1/23.
//

import UIKit

import Kingfisher

class HomeTabTableViewCell: UITableViewCell {
    
    static let id = "ListCollectionViewCell"
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true //레이어가 잘려도 이미지 네모낳게 들어갈 수 있음
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
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
}
