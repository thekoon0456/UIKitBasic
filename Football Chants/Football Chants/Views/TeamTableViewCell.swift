//
//  TeamTableViewCell.swift
//  Football Chants
//
//  Created by Deokhun KIM on 2023/02/21.
//

import UIKit

//delegate: 한 개체에서 다른 개체로 작업을 위임
//이 delegate가 이 tableView내의 모든 작업을 처리함. 이 delegate를 구독하면 여기 함수들 output을 받게 됨
protocol TeamTableViewCellDelegate: class {
    func didTapPlayBack(for team: Team)
}

class TeamTableViewCell: UITableViewCell {

    static let cellId = "TeamTableViewCell" //static: 초기화 필요없이 접근 가능
    
    //MARK: - UI
    //1. 컨테이너 뷰
    private lazy var containerVw: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    private lazy var contentStackVw: UIStackView = {
        let stackVw = UIStackView()
        stackVw.translatesAutoresizingMaskIntoConstraints = false
        stackVw.spacing = 4
        stackVw.axis = .vertical
        return stackVw
    }()
    
    private lazy var badgeImgVw: UIImageView = {
        let imgVw = UIImageView()
        imgVw.translatesAutoresizingMaskIntoConstraints = false
        imgVw.contentMode = .scaleAspectFit
        return imgVw
    }()
    
    private lazy var playbackbtn = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tintColor = .white
        return btn
    }()
    
    private lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var foundedLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .bold)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var jobLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 10, weight: .bold)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var infoLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 12, weight: .bold)
        lbl.textColor = .white
        return lbl
    }()
    
    private weak var delegate: TeamTableViewCellDelegate?
    private var team: Team?
    

    //MARK: - LifeCycle
    override func layoutSubviews() {
            super.layoutSubviews()
        containerVw.layer.cornerRadius = 10
    }
    
    //화면에서 사라졌다 다시 나올때 그려짐
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach{ $0.removeFromSuperview() }
    }

    //input제어
    func configure(with item: Team, delegate: TeamTableViewCellDelegate) {
        
        self.team = item
        self.delegate = delegate
        
        playbackbtn.addTarget(self, action: #selector(didTapPlayback), for: .touchUpInside)
        
        containerVw.backgroundColor = item.id.background
        
        badgeImgVw.image = item.id.badge
        playbackbtn.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        
        nameLbl.text = item.name
        foundedLbl.text = item.founded
        jobLbl.text = "Current \(item.manager.job.rawValue): \(item.manager.name)"
        infoLbl.text = item.info
        
        self.contentView.addSubview(containerVw)
        
        containerVw.addSubview(contentStackVw)
        containerVw.addSubview(badgeImgVw)
        containerVw.addSubview(playbackbtn)
        
        contentStackVw.addArrangedSubview(nameLbl)
        contentStackVw.addArrangedSubview(foundedLbl)
        contentStackVw.addArrangedSubview(jobLbl)
        contentStackVw.addArrangedSubview(infoLbl)
        
        NSLayoutConstraint.activate([
            containerVw.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerVw.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerVw.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerVw.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            badgeImgVw.heightAnchor.constraint(equalToConstant: 50),
            badgeImgVw.widthAnchor.constraint(equalToConstant: 50),
            badgeImgVw.topAnchor.constraint(equalTo: contentStackVw.topAnchor),
            badgeImgVw.leadingAnchor.constraint(equalTo: containerVw.leadingAnchor, constant: 8),
            
            contentStackVw.topAnchor.constraint(equalTo: containerVw.topAnchor, constant: 16),
            contentStackVw.bottomAnchor.constraint(equalTo: containerVw.bottomAnchor, constant: -16),
            contentStackVw.leadingAnchor.constraint(equalTo: badgeImgVw.trailingAnchor, constant: 8),
            contentStackVw.trailingAnchor.constraint(equalTo: playbackbtn.leadingAnchor, constant: -8),
            
            playbackbtn.heightAnchor.constraint(equalToConstant: 44),
            playbackbtn.widthAnchor.constraint(equalToConstant: 44),
            
            playbackbtn.trailingAnchor.constraint(equalTo: containerVw.trailingAnchor, constant: -8),
            playbackbtn.centerYAnchor.constraint(equalTo: containerVw.centerYAnchor)
            
            
        ])
    }
    
    //@selector로 작업할때 작성
    @objc func didTapPlayback() {
        if let team = team {
            delegate?.didTapPlayBack(for: team)
        }
    }
}
