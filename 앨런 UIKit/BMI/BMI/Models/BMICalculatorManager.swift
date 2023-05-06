//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by Deokhun KIM on 2023/05/06.
//

import UIKit

struct BMICalculatorManager {
    
    var result: Double = 0
    var resultBackgroundColor: UIColor = .clear
    var resultMent = ""
    
    //앨런 bmi 메서드
    //메서드 따로 작성하는 이유: 함수는 하나의 역할만!! 하는것이 좋음
    func calculateBMI(height: Double, weight: Double) -> Double {
        let h = height
        let w = weight
        
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10 //소수점 버린 뒤에 나눠줌. ex) 21.6093 => 216 -> 21.6
        return bmi
    }
    
    mutating func calcBMI() {
        switch result {
        case 0..<18.6:
            resultBackgroundColor = .cyan
            resultMent = "저체중"
        case 18.6..<23.0:
            resultBackgroundColor = .green
            resultMent = "표준"
        case 23.0..<25.0:
            resultBackgroundColor = .purple
            resultMent = "과체중"
        case 25.0..<30:
            resultBackgroundColor = .orange
            resultMent = "중도 비만"
        default:
            resultBackgroundColor = .red
            resultMent = "고도 비만"
        }
    }
    
}
