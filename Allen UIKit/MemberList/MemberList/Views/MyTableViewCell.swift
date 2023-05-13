//
//  MyTableViewCell.swift
//  MemberList
//
//  Created by Deokhun KIM on 2023/05/13.
//

import UIKit

final class MyTableViewCell: UITableViewCell {
    
    //MARK: - UI 구현
    lazy var mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = self.frame.width / 2
        return imageView
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    //애플이 UITableViewCell만들때 사용하는 생성자. cell인스턴스 만들때 필요한것 세팅.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setUPStackView()
    }
    
    func setUPStackView() {
        self.addSubview(mainImageView)
        //셀 위에 스택뷰 올리기
        self.addSubview(stackView)
        
        //스택뷰 위에 뷰 올리기
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(addressLabel)
        
    }
    
    //필수생성자 자동으로 상속되지 않기 때문에 구현
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 오토 레이아웃 세팅
    //오토레이아웃 잡아주는 함수 구현
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    //cell에서 imageView 넓이의 반으로 세팅. 실제로 넓이 정해지는 순간이 layoutSubviews()호출되는 순간이라 여기에서 세팅
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
//    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 40),
            mainImageView.widthAnchor.constraint(equalToConstant: 40),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
        
    }
    

    
}
