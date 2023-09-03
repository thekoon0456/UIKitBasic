//
//  ViewController.swift
//  TVMOVIE
//
//  Created by Deokhun KIM on 2023/09/01.
//

import UIKit
import SnapKit
import RxSwift

//1섹션, 1아이템, 1레이아웃
//레이아웃 기준
enum Section: Hashable { //하나의 레이아웃 구분하는 기준
    case double //하나의 행에 cell 두개 들어감
}

//Cell 기준
enum Item: Hashable { //해당 레이아웃에 어떤 cell을 쓸지
    case normal(Tv)
}

class ViewController: UIViewController {
    let disposeBag = DisposeBag() //뷰컨 메모리 해제될때 구독 메모리도 해제. 바인딩 끝남
    let buttonView = ButtonView()
    let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(NormalCollectionViewCell.self,
                                forCellWithReuseIdentifier: NormalCollectionViewCell.id)
        return collectionView
    }()
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
    
    private func bindViewModel() { //asObservable: Subject를 Observable로 변환
        let input = ViewModel.Input(tvTrigger: tvTrigger.asObservable(),
                                    movieTrigger: movieTrigger.asObservable())
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
            self?.tvTrigger.onNext(Void()) //버튼 트리거를 하기 위해 아무 값도 주지 않고 Void로 트리거 호출
        }.disposed(by: disposeBag)
        
        buttonView.movieButton.rx.tap.bind { [weak self] in
            self?.movieTrigger.onNext(Void())
        }.disposed(by: disposeBag)
    }

    
//    private func creageLayout
}

