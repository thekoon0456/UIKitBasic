//
//  NextViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/26/23.
//

import UIKit

protocol NextViewControllerDelegate: AnyObject {
    func nextVC()
}

final class NextViewController: UIViewController {
    
    weak var delegate: NextViewControllerDelegate?
    
    private lazy var naviButton = {
        let button = UIButton()
        button.setTitle("다음 뷰로 가기", for: .normal)
        button.addTarget(self,
                         action: #selector(nextButtonClicked),
                         for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(naviButton)
        naviButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc
    func nextButtonClicked() {
        print("마지막 뷰컨입니다.")
    }
    
}
