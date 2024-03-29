//
//  ViewController.swift
//  MemberList
//
//  Created by Deokhun KIM on 2023/05/10.
//

import UIKit

final class ViewController: UIViewController {
    //테이블뷰 만들때는 뷰를 따로 만들필요없음.
    //위에 셀이 올라가니까 셀만 코드로 구현하기
    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()
    
    //네비게이션바에 넣기 위한 버튼
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    @objc func plusButtonTapped() {
        //다음 화면으로 이동, 멤버는 전달하지 않음
        let detailVC = DetailViewController()
        
        //화면 이동
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTableView()
        setUpDatas()
        setUpNaviBar()
        setupTableViewConstraints()
        
    }
    
    //delegate 구현시 필요없을듯
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //테이블뷰 업데이트
//        tableView.reloadData()
//    }
    
    func setUpNaviBar() {
        title = "회원 목록"
        
        //네비게이션바 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() //불투명
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        //네비게이션 오른쪽 상단 버튼. 버튼 만든 뒤에 올림
        self.navigationItem.rightBarButtonItem = self.plusButton
    }

    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        //tableView에 Identifier 등록
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    func setUpDatas() {
        //배열에 데이터 넣음
        memberListManager.makeMemersListDatas()
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
}

//delegate 패턴으로 뷰컨트롤러 이동
extension ViewController: UITableViewDelegate {
    //cell이 선택되었을때 메서드를 통해 동작 전달
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //다음 화면으로 넘어가는 코드
        let detailVC = DetailViewController()
        detailVC.delegate = self
        
        let array = memberListManager.getMemberList()
        detailVC.member = array[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: MemberDeletage {
    func addNewMember(_ member: Member) {
        memberListManager.makeNewmember(member) //멤버 업데이트
        tableView.reloadData() //리프레시
    }
    
    func update(index: Int, _ member: Member) {
        memberListManager.updateMemberInfo(index: index, member)
        tableView.reloadData()
    }
    
}
