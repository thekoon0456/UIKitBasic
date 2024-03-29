//
//  DetailInfoInputViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/28/23.
//

import UIKit

import SnapKit

protocol DetailInfoInputViewControllerDelegate: AnyObject {
    func showMainTabView()
}

final class DetailInfoInputViewController: UIViewController {
    
    weak var delegate: DetailInfoInputViewControllerDelegate?
    
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
        print("DetailInfoInputViewController 등장")
    }
    
    deinit {
        print("DetailInfoInputViewController 해제")
    }
    
    @objc
    func exButtonTapped() {
        //네비게이션 넣기
        delegate?.showMainTabView()
        print("exButtonTapped, 메인 뷰로")
    }
    
    private func configureUI() {
        view.backgroundColor = .red
        view.addSubview(exLable)
        exLable.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        view.addSubview(exButton)
        exButton.snp.makeConstraints { make in
            make.top.equalTo(exLable.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
