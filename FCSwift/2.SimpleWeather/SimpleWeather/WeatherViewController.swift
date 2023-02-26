//
//  WeatherViewController.swift
//  SimpleWeather
//
//  Created by Deokhun KIM on 2022/07/14.
//

import UIKit

class WeatherViewController: UIViewController {
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let cities = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weathers = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.rain.fill"]
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        
        cityLable.text = cities.randomElement()
        let imageName = weathers.randomElement()!
        weatherImageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        //템플릿이 아닌 랜더링 이미지로 해야하므로.withRenderingMode(.alwaysOriginal)
        
        let randomTemp = Int.random(in: 10..<30)
        temperatureLable.text = "\(randomTemp)°"
        print("도시, 온도, 날씨 이미지 변경하자!!")
        
    }
    
}

//스택뷰 안에는 기본적으로 다 꽉 채움
//패딩 넣고 싶으면 뷰 안에 넣기
