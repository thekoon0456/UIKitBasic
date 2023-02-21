//
//  ChantsViewController.swift
//  Football Chants
//
//  Created by Deokhun KIM on 2023/02/21.
//

import UIKit

class ChantsViewController: UIViewController {

    //MARK: - UI
    private lazy var tableVw: UITableView = {
        let tv = UITableView() //내부에서 테이블 뷰 만듬
        tv.translatesAutoresizingMaskIntoConstraints = false //중요! 오토레이아웃 설정. false 안해주면 작동하지 않음
        tv.backgroundColor = .clear //배경 투명
        tv.rowHeight = UITableView.automaticDimension //행 높이 자동, 크기에 따라 늘어남
        tv.estimatedRowHeight = 44 //예상(기본)높이 44
        tv.separatorStyle = .none //분리스타일 없이
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") //각 셀마다 테이블뷰셀 등록
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        return tv
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    private lazy var audioManagerViewModel = AudioManagerViewModel()
    
    //MARK: - LoadView Cycle 에서 setUp함수 호출 / LifeCycle
    override func loadView() {
        super.loadView()
        setUp()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white //뷰 배경화면
    }

    
}

private extension ChantsViewController {
    //MARK: - cell 호출 함수 생성
    func setUp() {
        
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        //테이블뷰에 사용할 데이터소스 설정
        tableVw.dataSource = self
        //autoLayout 사용해 테이블뷰 추가
        self.view.addSubview(tableVw)
        //제약조건 활성화
        NSLayoutConstraint.activate([
            //테이블 뷰를 왼쪽 상단에 고정
            //constant에 8 등 수치를 넣을수도 있음. 그러면 테이블뷰를 8만큰 밀어야 함
            tableVw.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableVw.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableVw.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableVw.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension ChantsViewController: UITableViewDataSource {
    //UITableViewDataSource 프로토콜 사용할때 두가지 함수 필수 사용해야 함
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsViewModel.teams.count //팀 갯수만큼 반복해서 가져옴
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //indexPath.row: 식별자 있거나 현재 행의 번호 알고 있으면 0에서 19로 이동
        let team = teamsViewModel.teams[indexPath.row]
        let cell = tableVw.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId , for: indexPath) as! TeamTableViewCell
        cell.configure(with: team, delegate: self) //delegate: 뷰컨트롤러를 뷰셀테이블에 연결, 앱 내의 delegate가 실행될때마다 아래 didTapPlayBack가 트리거됨
        return cell
    }
}

extension ChantsViewController: TeamTableViewCellDelegate {
    func didTapPlayBack(for team: Team) {
        audioManagerViewModel.playback(team)
        teamsViewModel.togglePlayback(for: team)
        tableVw.reloadData() //테이블뷰 다시 로드
        print("The item that was selected: \(team.name)")
    }
}

