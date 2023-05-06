//
//  SecondViewController.swift
//  BMI
//
//  Created by Deokhun KIM on 2023/05/04.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var ment: UILabel!
    @IBOutlet weak var reCalcButton: UIButton!
    
    var result: Double = 0
    var resultMent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcBMI()
        configureUI()
    }
    
    func configureUI() {
        bmi.text = String(format: "%.2f", result)
        bmi.layer.cornerRadius = 10
        ment.text = resultMent
        reCalcButton.layer.cornerRadius = 10
    }
    
    func calcBMI() {
        switch result {
        case 0..<18.6:
            bmi.backgroundColor = .cyan
            resultMent = "저체중"
        case 18.6..<23.0:
            bmi.backgroundColor = .green
            resultMent = "표준"
        case 23.0..<25.0:
            bmi.backgroundColor = .purple
            resultMent = "과체중"
        case 25.0..<30:
            bmi.backgroundColor = .orange
            resultMent = "중도 비만"
        default:
            bmi.backgroundColor = .red
            resultMent = "고도 비만"
        }
    }
    
    
    @IBAction func reCalc(_ sender: UIButton) {
        dismiss(animated: true)
        result = 0
    }
    
}
