//
//  PersonCollectionViewCell.swift
//  UIKitCrashCourse
//
//  Created by Deokhun KIM on 2023/03/09.
//

import UIKit

protocol PersonCollectionViewCellDelegate: AnyObject {
    func didTapSubscribe()
}

class PersonCollectionViewCell: UICollectionViewCell {
    
    private var vw: PersonView?
    
    weak var delegate: PersonCollectionViewCellDelegate?
    
    //뷰컨트롤러에 데이터 할당할때마다 트리거됨
    var item: PersonResponse? {
        didSet {
            
            guard let firstName = item?.firstName,
                  let lastName = item?.lastName,
                  let email = item?.email else {
                return
            }
            
            vw?.set(name: "\(firstName) \(lastName)", email: email)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PersonCollectionViewCell {
    
    func setup() {
        //뷰가 옵셔널. 생성하기 전에 비어있는지 확인
        guard vw == nil else { return }
        
        vw = PersonView { [weak self] in
            self?.delegate?.didTapSubscribe()
        }
        
        self.contentView.addSubview(vw!)
        
        NSLayoutConstraint.activate([
            
            vw!.topAnchor.constraint(equalTo: contentView.topAnchor),
            vw!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            vw!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            vw!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            
        ])
    }
}
