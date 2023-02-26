//
//  StockRankViewController.swift
//  StockRank
//
//  Created by Deokhun KIM on 2022/07/14.
//

import UIKit

class StockRankViewController: UIViewController {

    let stockList: [StockModel] = StockModel.list
    //.list: 안에 리스트
    
    
    @IBOutlet weak var collectionView: UICollectionView!
  
    //컬렉션뷰 고려할 점
    //Data, Presentation, Layout
    //Data: 어떤 데이터를 쓸건지? (데이터: StockModel, 아이콘: Assets)
    //Presentation: cell을 어떨게 표현할건지?
    //Layout: cell을 어떻게 배치할건지?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Data, Presentation에 대해서 어떤걸 쓸것인지 어떻게 표현할건지 알려줘야한다.
        collectionView.dataSource = self
        //컬렉션뷰에 누가 데이터를 알려줄꺼냐? = self(StockRankViewController)
        collectionView.delegate = self
        //delegate: 레이아웃, 셀 사이즈는 어떻게 할것인지 등 알려줌
        //dataSource, delegate는 프로토콜
        //protocol - 수행해야하는 규칙 따르기
    }
    
}
//쌤은 프로토콜 한 곳에 안모으고 분리해서 쓰려고 함
extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //컬렉션 뷰에게 몇개의 셀이 필요한가? 물어보는 메소드
        //아이템 섹션 개수가 변경될수도 있으므로 숫자보다는 .count 프로퍼티로 넣어주는게 좋음
        return stockList.count
        //스톡 리스트 만큼 표현하면 된다.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //하나의 셀을 표현할때, 각 셀을 어떻게 표현할건지에 대한 메소드
        //새로만든 커스텀 셀인 StockRankCollectionViewCell을 이용해서 거기에 해당하는 데이터를 주면 셀이 그거에 맞게 꾸며지게 표시한 다음에 꾸며준 셀을 넘겨주면 표시됨
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        //dequeueReusableCell: 제사용 가능한 셀 등록하기
        //상수 cell의 타입은 UICollectionViewCell인데 이를 StockRankCollectionViewCell로 캐스팅한다.
        //?을 붙여주는건 캐스팅이 실패할수도 있기 때문에 as? 로 캐스팅
        
        let stock = stockList[indexPath.item]
        //indexPath.item: stockList 배열 섹션안에 아이템이 몇번째인지
        cell.configure(stock)
        return cell
        //.dequeueReusableCell-콜렉션뷰에 등록된 것들중 재사용 가능한 셀을 가져오겠다, 이름(구분자)(identifier) / 몇번째에 해당하는 셀인가
        
       // return UICollectionViewCell()
    }
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    //레이아웃을 어떻게 배치할것인지?
    //FlowLayout: 프로토콜. 약속대로 작성
    
    //사이즈를 어떨게 할것인지
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //width == collectionView, (셀 너비와 같게)
        //height = 80
        return CGSize(width: collectionView.bounds.width, height: 80)
    
    }
}
