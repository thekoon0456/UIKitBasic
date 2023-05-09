//
//  ViewController.swift
//  TableView
//
//  Created by Deokhun KIM on 2023/05/09.
//

import UIKit

final class ViewController: UIViewController {
    
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //두가지 다 delegate패턴. 중요해서 두개로
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
    }

}

//tableView 사용하려면 UITableViewDataSource 채택해야함.
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    //UITableViewDataSource 필수구현 메서드
    
    //몇개의 컨텐츠 만들면 되는지 알려주는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count
    }
    
    //cell을 어떤 방식으로 표시하는지. 테이블뷰 셀을 그림
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
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

/*
 indexPath는 두가지가 있음.
 indexPath.section // 그룹을 만들었을때 무슨 그룹인지 번호
 indexPath.row // 몇번째 행인지 번호
 */
