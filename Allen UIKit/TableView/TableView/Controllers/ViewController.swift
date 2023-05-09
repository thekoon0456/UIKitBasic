//
//  ViewController.swift
//  TableView
//
//  Created by Deokhun KIM on 2023/05/09.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //mvc패턴 데이터 매니저
    private let movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //두가지 다 delegate패턴
        tableView.dataSource = self
        tableView.delegate = self
        //셀 높이 설정
        tableView.rowHeight = 120
        
        //코드베이스 사용시 셀 등록 메서드 넣기
    }

}

//tableView 사용하려면 UITableViewDataSource 채택해야함.
extension ViewController: UITableViewDataSource {
    //UITableViewDataSource 필수구현 메서드 두가지
    
    //몇개의 컨텐츠 만들면 되는지 알려주는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.getMovieData().count
    }
    
    //cell을 어떤 방식으로 표시하는지. 테이블뷰 셀을 그림
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeueReusableCell: 만든 재사용 가능한 cell을 꺼내서씀
        //indexPath: 테이블뷰에서 알아서 만들어냄. 경로. 몇번째 행에 있는 cell인지
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UITableViewCell() }
        
        //indexPath.row로 배열에 접근
        let movie = movieDataManager.getMovieData()[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieTitle
        cell.descriptionLabel.text = movie.movieDesciption
        cell.selectionStyle = .none //셀 선택시 이펙트
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    //테이블뷰 위의 셀이 선택되었을때 메서드 실행됨
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //세그웨이 실행. sender: 로 indexPath 전달
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    //스토리보드 통해서 데이터 전달시 prepare사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //1. identifier 확인
        if segue.identifier == "toDetail" {
            //2. 데이터 전달
            guard let detailVC = segue.destination as? DetailViewController else { return }
            
            //performSegue에서 보낸 indexPath 받기
            let indexPath = sender as! IndexPath
            
            //우리가 전달하기 원하는 영화 데이터
            detailVC.movieData = movieDataManager.getMovieData()[indexPath.row]
        }
    }
    
}

/*
 indexPath는 두가지가 있음.
 indexPath.section // 그룹을 만들었을때 무슨 그룹인지 번호
 indexPath.row // 몇번째 행인지 번호
 */

//delegate 사용해 cell이 눌렸음을 알고 데이터를 상세뷰로 전달



