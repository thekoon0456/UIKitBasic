//
//  ViewController.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let buttonView = ButtonView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.addSubview(buttonView)
        buttonView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        collectionView.backgroundColor = .red
    }


}

