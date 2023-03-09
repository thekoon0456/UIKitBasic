//
//  PeopleViewController.swift
//  UIKitCrashCourse
//
//  Created by Deokhun KIM on 2023/03/06.
//

import UIKit
import SafariServices //safari뷰 사용

class PeopleViewController: UIViewController {

//    //UIView만들고 다른 모든 요소에 대한 컨터이너로 사용
//    private lazy var personVw: PersonView = {
//
//        let vw = PersonView { [weak self] in
//            self?.sayHello()
//        }
//        return vw
//    }()
//
    //컬렉션뷰로 리팩토링
    
    private let vm = PeopleViewModel() //뷰모델 연동
    
    private lazy var cv: UICollectionView = { //UICollectionView: SwiftUI Grid와 유사 / tableView는 list와 유사. 곧 사용안한다고 함
        //1. 컬렉션뷰에 대한 레이아웃 생성
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130) //화면크기로
        //2. 컬렉션뷰 생성
        let vw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vw.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell") //뷰에 셀 등록
        vw.dataSource = self //데이터 넣어주기
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("하이1")
        setup()
        vm.delegate = self
        vm.getUsers() //api에서 getusers
    }

}
//코드베이스로 만들때는 배경까지 모든걸 설정해줘야 함
//기능별로 나눠서 함수 만듬
extension PeopleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { //화면에 표시하려는 항목
        vm.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { //화면에 표시하는 셀
        let item = vm.people[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as! PersonCollectionViewCell//재사용셀 설정
        
        cell.delegate = self
        cell.item = item
        return cell
    }
    
    
}

extension PeopleViewController: PeopleViewModelDelegate {
    func didFinish() {
        //뷰가 새로고침되므로 main스레드에서 동작하도록 설정
        cv.reloadData() //새로고침
    }
    
    func didFail(error: Error) {
        print(error)
    }
    
}

extension PeopleViewController: PersonCollectionViewCellDelegate {
    func didTapSubscribe() {
        
        let url = URL(string: "http://www.google.com")!
        let vc = SFSafariViewController(url: url)
        //모달로
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
}

private extension PeopleViewController {
    func setup() {
        //navigationTitle추가
        self.navigationController?.navigationBar.prefersLargeTitles = true //타이틀 크게
        self.navigationItem.title = "People" //작게 나옴


        self.view.backgroundColor = .white
        
        //컬렉션뷰 추가
        self.view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        ])
        
        
        
        
//        //addSubView로 화면에 구체적인 뷰 추가
//
//        //실제 뷰 구현
//        //1.UIVew 먼저 추가
//        self.view.addSubview(personVw)
//
//        NSLayoutConstraint.activate([
//            //personContainerVw 추가하고 중앙정렬
//            personVw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            //center로 안하고 leading, trailing 고정해서 꽉 채움 /constant로 padding처럼 사용. 밀어넣으므로 trailing방향에서는 음수
//            personVw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
//            personVw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
//        ])
//
    }
    
    func sayHello() {
        print("하이2")
    }
    
}



