//
//  ViewController.swift
//  RPSGame
//
//  Created by Deokhun KIM on 2023/04/28.
//

import UIKit

class ViewController: UIViewController {

    //변수 / 속성
    @IBOutlet weak var mainLable: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLable: UILabel!
    @IBOutlet weak var myChoiceLable: UILabel!
    
    //처음 실행했을때 컴퓨터가 랜덤 가위바위보 값을 가짐
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))! //Rps(rawValue: 0) => .rock
    
    var myChoice: Rps = .rock //처음엔 묵을 선택
    
    //함수 / 메서드
    //앱의 화면에 들어오면 처음 실행되는 함수 - 기본적인 뷰 세팅
    override func viewDidLoad() {
        super.viewDidLoad()
         //1. 첫/두번째 이미지뷰에 준비(묵) 이미지를 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready")
        
         //2. 첫/두번째 레이블에 "준비" 문자열 띄워야 함
        comChoiceLable.text = "준비"
        myChoiceLable.text = "준비"
    }

    //비슷한 역할 하는 경우 함수 하나에 여러 버튼 연결
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        //가위/바위/보(enum) 선택해서 그 정보를 저장해야 함
        //버튼 현재 타이틀(가위/바위/보)
        guard let title = sender.currentTitle else { return }
        print(title)
        
        switch title {
        case "가위":
            myChoice = .scissors
        case "바위":
            myChoice = .rock
        case "보":
            myChoice = .paper
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        //1. 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        //2. 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice {
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLable.text = "바위"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLable.text = "보"
        case .scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLable.text = "가위"
        }
        //3. 내가 선택한 것을 이미지뷰에 표시
        //4. 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLable.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLable.text = "보"
        case .scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLable.text = "가위"
        }
        
        //5. 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단/표시
        
        if comChoice == myChoice {
            mainLable.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper{
            mainLable.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors{
            mainLable.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock{
            mainLable.text = "이겼다"
        } else {
            mainLable.text = "졌다"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        //1. 컴퓨터가 다시 처음 준비 이미지뷰에 표시
        //2. 컴퓨터가 다시 준비 레이블에 표시
            comImageView.image = #imageLiteral(resourceName: "ready")
            comChoiceLable.text = "준비"
        //3. 내 선택 이미지뷰에서 준비 이미지 표시
        //4. 내 선택 레이블에도 준비 문자열 표시
            myImageView.image = #imageLiteral(resourceName: "ready")
            myChoiceLable.text = "준비"
        
        //5. 메인 레이블 "선택하세요" 표시
            mainLable.text = "선택하세요"
        //6. 컴퓨터가 다시 랜덤 가위/바위/보 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
}


