//
//  HomeViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit

class HomeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var viewModel = HomeTabViewModel()
    let tvTrigger = PublishSubject<Void>()
    var HomeTabCoordinator: HomeTabCoordinator?
    
    private lazy var tableView = {
        let tableView = UITableView()
        tableView.register(HomeTabTableViewCell.self, forCellReuseIdentifier: HomeTabTableViewCell.id)
        tableView.rowHeight = 100.0
        return tableView
    }()
    
    private lazy var requestButton = {
        let button = UIButton()
        button.setTitle("요청", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(requestButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func requestButtonTapped() {
        tvTrigger.onNext(())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
//        tvTrigger.onNext(())
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvTrigger.onNext(())
    }
    
    func bindUI() {
        let input = HomeTabViewModel.Input(tvTrigger: tvTrigger.asObserver())
        
        let output = viewModel.transform(input: input)
        
        //        output
        //            .tvList
        //            .bind(to: tableView.rx.items) { tableView, index, element in
        //            print("output실행")
        //            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTabTableViewCell.id) as? HomeTabTableViewCell else { fatalError() }
        //            cell.config(title: element.name, releaseDate: element.firstAirDate, url: element.posterURL)
        //            return cell
        //        }
        //        .disposed(by: disposeBag)
        output.tvList.bind(to: tableView.rx.items(cellIdentifier: HomeTabTableViewCell.id,
                                                  cellType: HomeTabTableViewCell.self)
        ) { index, item, cell in
            cell.config(title: item.name, releaseDate: item.firstAirDate, url: item.posterURL)
        }
        .disposed(by: disposeBag)
    }
    
    private func configureUI() {
        view.addSubview(requestButton)
        requestButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
        }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(requestButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
}
