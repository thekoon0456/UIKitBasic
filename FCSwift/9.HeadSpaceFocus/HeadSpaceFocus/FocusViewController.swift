//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by Deokhun KIM on 2022/07/19.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    
    //버튼 현재 큐레이팅 중인지 bool타입으로 표시
    var curated: Bool = false
    var items: [Focus] = Focus.list
    
    typealias Item = Focus
    enum Section {
        case main
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.layer.cornerRadius = 10 //리프레시 버튼 모서리 둥글게
        //Presentation, Data, Layout
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            cell.configure(item) //cell에 데이터 넣어줌
            //예전 방식, 이거랑 내용 같음
//            let data = self.items[indexPath.item]
//            cell.configure(data)
            return cell
        })
        
        //data: Snapshot (섹션, 아이템)
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])//단일 섹션이니까 메인 하나만 들어감
        snapshot.appendItems(items, toSection: .main) //아이템을 메인 섹션에 넣음
        datasource.apply(snapshot) //apply()로 참인 데이터소스 하나만 사용. 버그 줄임
        
        collectionView.collectionViewLayout = layout()
        
        //버튼 타이틀 업데이트 (전체시, 추천시 보이는 버튼이 다름)
        //삼항연산자 사용
        updateButtonTitle()
        //실제 리프레시버튼에 타이틀로 설정

    }
    
    private func layout() -> UICollectionViewCompositionalLayout{
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        //estimated: 기본50정도 높이 예상하는데 콘텐츠에 따라 변경할 수 있다.1로 해도 상관없음, 늘어남에 따라서 알아서 조정되므로 <-> .absolute (정대적수치)
        //fractionWidth: 화면 너비 다 쓰겠다. 반만 쓰려면 0.5로 설정
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        //좌우 padding
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        //그룹간 간격
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    //반복되는 코드 하나의 메소드로 관리 (버튼 업데이트)
    func updateButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
    //리프레시 버튼이 탭이 되었을때
    @IBAction func refreshButtonTapped(_ sender: Any) {
        curated.toggle() //.toggle: 불리언타입 스위칭됨
        self.items = curated ? Focus.recommendations : Focus.list
        //큐레이션 중이면 추천리스트, 아니면 전체리스트 가져옴
        
        //아이템 변경사항 있을때 컬렉션뷰에 스냅샷으로 업데이트 시킴
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        //스냅샷 적용
        datasource.apply(snapshot)
        //타이틀 업데이트
        updateButtonTitle()
    }
}
