//
//  SecondViewController.swift
//  BMI
//
//  Created by Deokhun KIM on 2023/05/04.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var reCalcButton: UIButton!
    
    var result: Double = 0
    var resultMent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcBMI()
        configureUI()
    }
    
    func configureUI() {
        bmiNumberLabel.text = String(format: "%.2f", result)
        bmiNumberLabel.layer.cornerRadius = 8
        
        adviceLabel.text = resultMent
        reCalcButton.layer.cornerRadius = 5
    }

    func calcBMI() {
        switch result {
        case 0..<18.6:
            bmiNumberLabel.backgroundColor = .cyan
            resultMent = "저체중"
        case 18.6..<23.0:
            bmiNumberLabel.backgroundColor = .green
            resultMent = "표준"
        case 23.0..<25.0:
            bmiNumberLabel.backgroundColor = .purple
            resultMent = "과체중"
        case 25.0..<30:
            bmiNumberLabel.backgroundColor = .orange
            resultMent = "중도 비만"
        default:
            bmiNumberLabel.backgroundColor = .red
            resultMent = "고도 비만"
        }
    }
    
    
    @IBAction func reCalc(_ sender: UIButton) {
        dismiss(animated: true)
        result = 0
    }
    
}
