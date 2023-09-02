//
//  ViewController.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import UIKit
import SnapKit
import RxSwift

class ViewController: UIViewController {
    let disposeBag = DisposeBag() //뷰컨 메모리 해제될때 구독 메모리도 해제. 바인딩 끝남
    let buttonView = ButtonView()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let viewModel = ViewModel()
    
    //Subject: 이벤트를 발생시키면서, Observable 형태도 되는거
    let tvTrigger = PublishSubject<Void>()
    let movieTrigger = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        bindViewModel()
        bindView()
        tvTrigger.onNext(())
    }
    
    private func setUI() {
        view.addSubview(buttonView)
        buttonView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(buttonView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        
        collectionView.backgroundColor = .red
        
        
    }
    
    private func bindViewModel() {
        let input = ViewModel.Input(tvTrigger: tvTrigger.asObservable(), movieTrigger: movieTrigger.asObservable())
        
        let output = viewModel.transform(input: input)
        
        output.tvList.bind { tvList in
            print("tvList: \(tvList)")
        }.disposed(by: disposeBag)
        
        output.movieResult.bind { movieResult in
            print("movieList: \(movieResult)")
        }.disposed(by: disposeBag)
    }

    private func bindView() {
        buttonView.tvButton.rx.tap.bind { [weak self] in
            self?.tvTrigger.onNext(Void())
        }.disposed(by: disposeBag)
        
        buttonView.movieButton.rx.tap.bind { [weak self] in
            self?.movieTrigger.onNext(Void())
        }.disposed(by: disposeBag)
    }

}

