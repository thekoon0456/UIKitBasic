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
    
    var viewModel = HomeTabViewModel()
    let tvTrigger = PublishSubject<Void>()
    var HomeTabCoordinator: HomeTabCoordinator?
    
    private lazy var tableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindUI()
    }
    
    func bindUI() {
        let input = HomeTabViewModel.Input(tvTrigger: tvTrigger.asObserver())
        
        let output = viewModel.transform(input: input)
        
//        output.tvList.bind { [weak self] tvList in
//            <#code#>
//        }
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.backgroundColor = .blue
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
    }
}
