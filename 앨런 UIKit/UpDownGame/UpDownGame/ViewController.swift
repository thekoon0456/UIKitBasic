//
//  ViewController.swift
//  UpDownGame
//
//  Created by Deokhun KIM on 2023/04/28.
//

import UIKit

class ViewController: UIViewController {
    //컴퓨터가 선택한 숫자
    var answerNum: Int = Int.random(in: 1...10)
    //내가 선택한 숫자를 담는 변수
    var mySelectNum = 1
    
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var numberLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLable.text = "선택하세요"
        numberLable.text = ""
    }
    
    @IBAction func selectNumTapped(_ sender: UIButton) {
        //1. 버튼 숫자를 가져와야 함
        guard let numString = sender.currentTitle else { return }
        
        //2. 숫자 레이블이 숫자에 따라 변하도록
        numberLable.text = numString
        
        //3. 선택한 숫자를 변수에다가 저장(선택)
        guard let num = Int(numString) else { return }
        mySelectNum = num
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        //1. 메인 레이블 "선택하세요"
        mainLable.text = "선택하세요"
        //2. 숫자 레이블에 빈 문자열
        numberLable.text = ""
        
        //3. 컴퓨터의 랜덤숫자를 다시 선택하게
        answerNum = Int.random(in: 1...10)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        //컴퓨터의 숫자와 내가 선택한 숫자를 비교
        //up, down, bingo
        
        switch mySelectNum {
        case let a where a < answerNum:
            mainLable.text = "\(a)보다 Up"
        case let a where a > answerNum:
            mainLable.text = "\(a)보다 Down"
        default:
            mainLable.text = "Bingo!😎"
        }
    }
}

