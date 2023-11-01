//
//  DetailInfoInputViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/28/23.
//

import UIKit

import SnapKit

protocol DetailInfoViewControllerDelegate: AnyObject {
    func dismissViewController()
}

final class DetailInfoViewController: UIViewController {
    
    weak var delegate: DetailInfoViewControllerDelegate?
    
    private let exLable: UILabel = {
        let label = UILabel()
        label.text = "추가정보입력 뷰"
        return label
    }()
    
    private lazy var exButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인탭뷰로", for: .normal)
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
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
    func dismissViewController() {
        //네비게이션 넣기
        delegate?.dismissViewController()
        print("dismissViewController, 메인 뷰로")
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
