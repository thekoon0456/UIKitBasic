//
//  ViewController.swift
//  Football Chants
//
//  Created by Deokhun KIM on 2023/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemRed //배경색 설정해주기
    }


}

/*
 App의 LifeCycle
 1. App Delegate
 앱이 처음 열렸을때 기본적으로 작업이 수행됨
 설정, 구성
 push알람, background등
 
 2.Scene Delegate
 기본적으로 scene에 대해 표시됨. 사용자에게 제공하는 뷰컨트롤러
 
 3. View Controller
 뷰컨트롤러를 scene에 연결함
 
 3-1. loadView
 뷰컨트롤러가 메모리에 로드하면 loadView 실행됨
 
 3-2. ViewDidLoad
 뷰가 로드되었을때 한번 실행됨
 
 ui테이블뷰
 이미지, 컨텐츠
 화면에 보일때만 메모리에, 사라지면 메모리에서도 해제됨
 */

/*
 mvvm
 디자인패턴
 소프트웨어 엔지니어링
 재발하는 문제에 대한 재사용 가능한 솔루션을 엔지니어링
 비대해진 뷰컨트롤러는 하나으의 뷰컨트롤러 안에 코드가 다 있으므로 재사용 불가
 
 코드를 재사용 가능한 덩어리로 분리
 
 iOS에서 많이 사용됨
 뷰컨트롤러가 너무 커지는것 방지
 
 -mvvmc: mvvm + 코디네이터 패턴 사용함
 model: single Source of Truth, 데이터 structure, 데이터 정의
 
 ViewModel: 함수 등 뷰모델에 저장
 
 View: 화면에 그려지는 곳, 뷰모델을 이용해 모델과 상호작용
 
 //모델은 기본적으로 struct 사용
 값타입이므로 복사본 만들고, 레퍼런스 타입인 클래스보다 가벼움
 레퍼런스 타입은 생성하면 메모리에 있으므로
 프로퍼티중 하나를 변경하면 개체의 새 복사본이 생성되고 
 */
