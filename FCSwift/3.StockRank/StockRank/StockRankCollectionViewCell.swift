//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by Deokhun KIM on 2022/07/15.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    //UI컴포넌트를 연결하자
    //UI컴포넌트에 데이터를 업데이트하는 코드를 넣자
    
    //연결
    @IBOutlet weak var rankLable: UILabel!
    
    @IBOutlet weak var companyIconImageView: UIImageView!
    
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var companyPriceLable: UILabel!
    
    @IBOutlet weak var diffLable: UILabel!
    
    //데이터 업데이트하는 코드
    func configure(_ stock: StockModel) {
        rankLable.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyName.text = stock.name
        companyPriceLable.text = "\(convertToCurruncyFormat(price: stock.price))원"
        
//        //마이너스 diff는 파란색으로 표시
//        let color: UIColor
//        if stock.diff > 0 {
//           color = UIColor.systemRed
//        } else {
//           color = UIColor.systemBlue
//        }
//        diffLable.textColor = color
        
        //삼항 연산자 사용시 (조건 ? true일때 : false일때 )
        diffLable.textColor = stock.diff > 0 ?  UIColor.systemRed : UIColor.systemBlue
        diffLable.text = "\(stock.diff)%"
        
    }
    //가격에 콤마 넣기
    func convertToCurruncyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter() //NumberFormatter(): 숫자에 포맷팅을 도와주는 객체
        numberFormatter.numberStyle = .decimal //.decimal: 넘버 세자리 수마다 끊음
        numberFormatter.maximumFractionDigits = 0 //소수점 자리 필요없으니까 0으로
        let result = numberFormatter.string(from: NSNumber(value: price))! //(옵셔널 타입 String 타입으로 강제언래핑) //?? ""로 nil 인 경우에 빈 값 반환하는 방법도 있음.
        return result
    }
}
