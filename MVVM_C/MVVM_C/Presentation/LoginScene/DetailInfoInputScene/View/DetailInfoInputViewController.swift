//
//  DetailInfoInputViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/28/23.
//

import UIKit

import SnapKit

protocol DetailInfoInputControllerDelegate: AnyObject {
    func exButtonTap()
}

final class DetailInfoInputViewController: UIViewController {
    
    var delegate: DetailInfoInputControllerDelegate?
    
    private let exLable: UILabel = {
        let label = UILabel()
        label.text = "추가정보입력 뷰"
        return label
    }()
    
    private lazy var exButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인탭뷰로", for: .normal)
        button.addTarget(self, action: #selector(exButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc
    func exButtonTapped() {
        delegate?.exButtonTap()
    }
    
    private func configureUI() {
        view.addSubview(exLable)
        exLable.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
