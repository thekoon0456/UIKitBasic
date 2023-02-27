//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by joonwon lee on 2022/04/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    //컬렉션뷰는 스크롤뷰의 속성도 가지고 있음
    
    let messages: [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = .zero
        }
        //페이지 점 몇 개 만드는지
        pageControl.numberOfPages = messages.count
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else {
            return UICollectionViewCell()
        }
        let message = messages[indexPath.item]
        cell.configure(message)
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    //셀 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    //셀 간 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    //라인간 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

//페이지 넘길때마다 페이지 인덱스에 맞게 점 넘어가게
extension OnboardingViewController: UIScrollViewDelegate {
    //스크롤뷰 감속하면서 멈추는 것 인식
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        //오프셋을 너비로 나눠서 페이지 정보 알 수 있도록
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        //멈췄을때 currentPage가 업데이트 되도록
        pageControl.currentPage = index
    }
}
