//
//  HeaderView.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/03.
//

import Foundation
import UIKit

final class HeaderView: UICollectionReusableView {
    static let id = "HeaderView"
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
        }
    }
    
    public func config(title: String) {
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
