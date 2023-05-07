//
//  ViewController.swift
//  NextVC
//
//  Created by Deokhun KIM on 2023/05/04.
//

import UIKit

//코드로 만들면 모든 메모리에 한번에 올라감
//스토리보드: 메모리에 코드 올리고, 스토리보드 올리고 연결함

final class ViewController: UIViewController {

    //UIViewController에 var storyboard: UIStoryboard? 선언되어있음
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //1. 코드로 화면 이동 (다음 화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        
        //화면전환할 때 변수 someString에 데이터 전달
        firstVC.someString = "아기상어"
        firstVC.modalPresentationStyle = .fullScreen //풀스크린 모달
        present(firstVC, animated: true) //모달
    }
    
    
    //2. 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        //as로 타입캐스팅까지 하기!
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        secondVC.someString = "아빠상어"
        secondVC.modalPresentationStyle = .fullScreen //풀스크린 모달
        //스토리보드는 코드베이스처럼 바로 데이터 줄 수 없음! 생성되는 시간이 달라서. 연결되기 전
        //viewDidLoad()가 코드 인스턴스와 스토리보드 인스턴스를 연결된 다음 호출됨
//        secondVC.mainLabel.text = "아빠상어" //코드와 스토리보드가 연결되기 전이라서 에러남
        
        present(secondVC, animated: true)
    }
    
    //3. 스토리보드에서의 화면 이동 (간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        //버튼이 눌렸을때 performSegue() 실행됨. 실행시 prepare() 자동으로 호출.
        performSegue(withIdentifier: "toThirdVC", sender: self) //sender 보내는녀석. nil써도 되고 일반적으로 self사용
        
////간접 세그웨이는 여기서 조건 추가 가능
//        if num > 5 {
//
//        } else {
//            performSegue(withIdentifier: "toThirdVC", sender: self)
//        }
        
    }
    //prepare에서 segue 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThridViewController
            //thirdVC에 데이터 전달 가능
            thirdVC.modalPresentationStyle = .fullScreen
            thirdVC.someString = "엄마상어"
        }
        
        if segue.identifier == "toForthVC" {
            let forthVC = segue.destination as! ForthViewController
            //thirdVC에 데이터 전달 가능
            forthVC.someString = "뚜루루뚜루"
        }
    }
    
    //4. 버튼에 직접 segue연결시 performSegue 누른것과 같이 실행됨
    
    var num = 3
    //직접적으로 연결했을때만 shouldPerformSegue가 실행됨
    //어떤 조건에 따라 세그웨이 실행할지말지
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //num이 5 초과일때만 세그웨이 실행됨
        if num > 5 {
            return true
        } else {
            return false
        }
    }
}
