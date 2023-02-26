//
//  VChatListViewController.swift
//  ChatList
//
//  Created by Deokhun KIM on 2022/07/15.
//

import UIKit

class ChatListViewController: UIViewController {

//뷰컨트롤러랑 컬렌션뷰 연결해서 업데이트시킴
    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //컬렉션뷰에 내용 표시하려면
        //Data, Presentation, Layout
        
        collectionView.dataSource = self
        //데이터소스는 데이터와 프리센테이션을 책임짐 - 내가 알려줄게
        collectionView.delegate = self
        //델리게이트 - 레이아웃 누구에게 위임? - 내가 관리할게
        //컬렉션의 세가지를 위임당하는 객체는 셀프(챗리스트 뷰컨트롤)
        
        //내림차순으로 배열 정렬 ex) 1, 4, 5, 2 -> 5, 4, 2, 1
        chatList = chatList.sorted(by: {chat1, chat2 in
            return chat1.date > chat2.date
        }) //두개 비교했을때 항상 참이 되도록 비교하라
    }
}

//프로토콜이므로 해야할 약속 준수해줘야됨 (컨퍼밍) (밑에 두가지 메소드 구현해줘야됨)
extension ChatListViewController: UICollectionViewDataSource {
    //컬렉션뷰에 표현되는 아이템 개수는 몇개인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    //셀을 어떻게 표현할지 정의해서 알려줘야됨
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //컬렉션뷰에 등록된 셀을 가져오기 위해 구분자 적어줌
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell() //케슽팅 실패시
        }
            //캐스팅이 성공되면 아래 구문 타게 됨
        let chat = chatList[indexPath.item] //챗리스트에서 순서에 해당하는 데이터 가져오려는 정보는 인덱스패스에 있음
        cell.configure(chat) //데이터를 넣어줘야 셀이 업데이트 됨
        return cell
    }
}
    
//레이아웃에 관해
//너비는 컬렉션부 자체와 같게, 높이는 100정도
extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100) //너비값은 bounds임
    }
}
