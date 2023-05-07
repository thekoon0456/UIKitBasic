//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Deokhun KIM on 2023/04/28.
//

import UIKit

//하나의 뷰에 하나의 코드묶음
class ViewController: UIViewController {
    //lable과 연결
    //@IBOutlet 어트리뷰트. 컴파일러가 읽을 수 있도록 정보 제공. Outlet은 배출구. 코드를 스토리보드로 전달
    @IBOutlet weak var mainLable: UILabel!
    
    //버튼 속성 변경시 버튼과 연결한 변수 만들어서 변경.
    @IBOutlet weak var myButton: UIButton!
    
    //앱의 화면에 들엉오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //앱의 화면 들어오면 함수가 실행되고 방가방가가 나옴
        mainLable.text = "방가방가"
        mainLable.backgroundColor = UIColor.yellow
        
    }
    
    //버튼 누르면 함수 실행
    //스토리보드의 이벤트를 함수로 실행
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLable.text = "안녕하세요"
        mainLable.backgroundColor = UIColor.yellow
        
        //#colorLiteral(
        mainLable.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        mainLable.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        //opt으로 대입할 타입 확인
        mainLable.textAlignment = NSTextAlignment.right
        
        myButton.backgroundColor = UIColor.yellow
        
        //버튼 타이틀 변경 함수
        myButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    
}

