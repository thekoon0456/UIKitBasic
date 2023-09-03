//
//  ButtonView.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import Foundation
import UIKit
import SnapKit

class ButtonView: UIView {
    let tvButton: UIButton = {
        let button = UIButton()
        button.setTitle("TV", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.configuration = UIButton.Configuration.bordered()
        return button
    }()
    
    let movieButton: UIButton = {
        let button = UIButton()
        button.setTitle("MOVIE", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.configuration = UIButton.Configuration.bordered()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    private func setUI() {
        addSubview(tvButton)
        tvButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        addSubview(movieButton)
        movieButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(tvButton.snp.right).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
