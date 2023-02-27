//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by Deokhun KIM on 2022/07/17.
//

import UIKit

class FrameworkListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    //Data: 어떤 데이터가 몇개 있나?, Presentation: 데이터를 셀에 어떻게 표현?, Layout: 셀들의 레이아웃을 어떻게?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        //CollectionView - Estimate Size none 코드로 작성가능 (코드에서는 제로로) - 코드로 표시해놓으면 직관적으로 알 수 있음
//        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowlayout.estimatedItemSize = .zero
//        }
        
        //좌우 여백 코드
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
        
        //네비게이션바 이름 표시
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
    
    }

}

extension FrameworkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        
        //셀에 필요한 데이터 세팅
        let framework = list[indexPath.item]
        cell.configure(framework)
        return cell
    }
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // | ㅁ  ㅁ  ㅁ |
        //3열일때 계산
        let interItemSpacing: CGFloat = 10 //셀 간의 간격 10
        let padding: CGFloat = 16

        //컬렉션뷰 너비
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3

        //컬렉션뷰 높이
        let height = width * 1.5
        return CGSize(width: width, height: height)
        
//        //2열 일때 계산
//        //컬렉션뷰 너비
//        let width = (collectionView.bounds.width - interItemSpacing * 1 - padding * 2) / 2
//
//        //컬렉션뷰 높이
//        let height = width * 1.5
//        return CGSize(width: width, height: height)
        
//        //4열 일때 계산
//        //컬렉션뷰 너비
//        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2) / 4
//
//        //컬렉션뷰 높이
//        let height = width * 1.5
//        return CGSize(width: width, height: height)
    }
        
        //아이템간 가로 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //라인간 세로 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

//아이콘 클릭했을때 반응 만들기
extension FrameworkListViewController: UICollectionViewDelegate {
    //아이템 선택했을때 이 메소드 호출됨 - didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
