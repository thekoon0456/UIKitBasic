//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by Deokhun KIM on 2022/07/15.
//

import UIKit
//컬렉션뷰 셀을 담당하는 객체
class ChatListCollectionViewCell: UICollectionViewCell {
    //필요한 UI컴포넌트들 생성
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var chatLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    
    //스토리보드에서 이런 아이디가지고 있는애 꺼내올때 처음에 호출되는 함수 awakeFromib(), 꺼내와질때 설정
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10 //.cornerRadius 꺼내올때 코너 동그랗게
        
    }
 
    //셀 구성을 할때 chat 데이터들 받아서 각각의 이미지, 셀에 필요한 정보 등을 업데이트 하는 메소드 새로 만들어줌
    func configure(_ chat: Chat) {
        thumbnail.image = UIImage(named: chat.name)
        //UIImage에 chat.name을 가진 데이터 가져와라 (struct chat) Asset에서 이름대로 이미지 가져와서 thumbnail.image에 할당
        //chat 데이터 받아서 UI컴포넌트에 업데이트 해줌
        nameLable.text = chat.name
        chatLable.text = chat.chat
        dateLable.text = formattedDataString(dateString: chat.date)
    }
    //String -> Date 포맷 변경
    func formattedDataString(dateString: String) -> String {
        //2022-04-01 -> 4/1 (string 형태에서 4/1로 가공) (string -> Date -> String)
        //*DateFormatter 객체 이용해서 변겅
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        //String -> date타입으로 변경(Date) (Date 형식으로 변환 가능) (동 서양 다르게 표현도 가능)
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
}
