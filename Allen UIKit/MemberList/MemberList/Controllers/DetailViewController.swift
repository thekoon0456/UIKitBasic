//
//  DetailViewController.swift
//  MemberList
//
//  Created by Deokhun KIM on 2023/05/13.
//

import UIKit

final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    
    //전 화면에서 member 전달받음
    var member: Member?
    
    override func loadView() {
        view = detailView
        //super 호출X
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupButtonAction()
    }
    
    private func setupData() {
        detailView.member = member
    }
    
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    @objc func saveButtonTapped() {
        print("버튼이 눌림")
    }
    
}
