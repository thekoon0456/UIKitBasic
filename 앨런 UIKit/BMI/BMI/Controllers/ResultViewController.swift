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
    
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiManager.calcBMI()
        configureUI()
    }
    
    func configureUI() {
        bmiNumberLabel.text = String(format: "%.2f", bmiManager.result)
        bmiNumberLabel.backgroundColor = bmiManager.resultBackgroundColor
        bmiNumberLabel.layer.cornerRadius = 8
        
        adviceLabel.text = bmiManager.resultMent
        reCalcButton.layer.cornerRadius = 5
    }
    
    @IBAction func reCalc(_ sender: UIButton) {
        dismiss(animated: true)
        bmiManager.result = 0
    }
    
}
