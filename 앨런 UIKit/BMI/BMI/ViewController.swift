//
//  ViewController.swift
//  BMI
//
//  Created by Deokhun KIM on 2023/05/04.
//

import UIKit

class ViewController: UIViewController {

    //bmi = weight / height * height(m)
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiCalcButton: UIButton!
    
    var height: Double = 0
    var weight: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self

        configureUI()
    }
    
    func configureUI() {
        heightTextField.keyboardType = .numberPad
        heightTextField.placeholder = "키를 입력해주세요"
        weightTextField.keyboardType = .numberPad
        weightTextField.placeholder = "몸무게를 입력해주세요"
        bmiCalcButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func heightTextFieldTapped(_ sender: UITextField) {
        height = Double(sender.text ?? "0")!
    }
    
    @IBAction func weightTextFieldTapped(_ sender: UITextField) {
        weight = Double(sender.text ?? "0")!
    }
    
    @IBAction func bmiCalcButtonTapped(_ sender: UIButton) {
        let result = weight / (height * height) * 10000
        
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        resultVC.result = result
        present(resultVC, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
}
