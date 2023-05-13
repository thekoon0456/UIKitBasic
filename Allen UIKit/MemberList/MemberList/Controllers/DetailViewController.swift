//
//  DetailViewController.swift
//  MemberList
//
//  Created by Deokhun KIM on 2023/05/13.
//

import UIKit

final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    var member: Member?
    
    override func loadView() {
        view = detailView
        //super 호출X
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtonAction()
    }
    
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    @objc func saveButtonTapped() {
        print("버튼이 눌림")
    }
    
}
