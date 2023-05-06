//
//  ViewController.swift
//  BMI
//
//  Created by Deokhun KIM on 2023/05/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiCalcButton: UIButton!
    
//    //bmi = weight / height * height(m)
    var height: Double = 0
    var weight: Double = 0
    
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해주세요"
        bmiCalcButton.layer.cornerRadius = 5
        
        heightTextField.placeholder = "cm 단위로 입력해주세요"
        weightTextField.placeholder = "kg 단위로 입력해주세요"
        //        heightTextField.keyboardType = .numberPad
        //        weightTextField.keyboardType = .numberPad
    }
    
    @IBAction func heightTextFieldTapped(_ sender: UITextField) {
        height = Double(sender.text ?? "0") ?? 0
    }

    @IBAction func weightTextFieldTapped(_ sender: UITextField) {
        weight = Double(sender.text ?? "0") ?? 0
    }
    
    @IBAction func bmiCalcButtonTapped(_ sender: UIButton) {
        if heightTextField.text != "" && weightTextField.text != "" {
            let result = bmiManager.calculateBMI(height: height, weight: weight)
            let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            
            resultVC.bmiManager.result = result //데이터 전달
            present(resultVC, animated: true)
            
            mainLabel.text = "키와 몸무게를 입력해주세요"
            mainLabel.textColor = .black
            heightTextField.text = ""
            weightTextField.text = ""
        } else {
            mainLabel.text = "키와 몸무게를 입력하셔야한 합니다!!"
            mainLabel.textColor = .red
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    //텍스트필드에 입력되는 글자마다 실행됨
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string == "" { //숫자, 빈문자열 허용
            return true
        }
        return false //글자입력 허용 안함
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder() //키보드 해제
            return true
        //두번째 텍스트필드로 넘어가도록
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder() //키보드 넘김
            return true
        }
        return false
    }
    
    //유저 터치 일어나면 키보드 내림
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
    
}
