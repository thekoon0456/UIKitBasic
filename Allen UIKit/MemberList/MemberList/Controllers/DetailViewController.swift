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
        print("버튼 눌림")
        
        // [1] 멤버가 없다면 (새로운 멤버를 추가하는 화면)
        if member == nil {
            // 입력이 안되어 있다면.. (일반적으로) 빈문자열로 저장
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            // 새로운 멤버 (구조체) 생성
            var newMember =
            Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
            // 1) 델리게이트 방식이 아닌 구현⭐️
            let index = navigationController!.viewControllers.count - 2
            // 전 화면에 접근하기 위함
            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전 화면의 모델에 접근해서 멤버를 추가
//            vc.memberListManager.makeNewMember(newMember)
            
            
            // 2) 델리게이트 방식으로 구현⭐️
            //delegate?.addNewMember(newMember)
            
            
        // [2] 멤버가 있다면 (멤버의 내용을 업데이트 하기 위한 설정)
        } else {
            // 이미지뷰에 있는 것을 그대로 다시 멤버에 저장
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            // 뷰에도 바뀐 멤버를 전달 (뷰컨트롤러 ==> 뷰)
            detailView.member = member
            
            // 1) 델리게이트 방식이 아닌 구현⭐️
            let index = navigationController!.viewControllers.count - 2
            // 전 화면에 접근하기 위함
            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전 화면의 모델에 접근해서 멤버를 업데이트
            vc.memberListManager.updateMemberInfo(index: memberId, member!)
            
            
            // 델리게이트 방식으로 구현⭐️
            //delegate?.update(index: memberId, member!)
        }
        
        // (일처리를 다한 후에) 전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("디테일 뷰컨트롤러 해제")
    }
}
