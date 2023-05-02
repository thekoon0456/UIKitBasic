//
//  ViewController.swift
//  FirstNewApp
//
//  Created by Deokhun KIM on 2023/05/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer? //여기서 weak로 선언이 안되면 strong refelence cycle 일어남. 메모리에서 해제되지 않을 가능성 있음. Timer를 weak로 약하게 가르키므로 클로저 내부에서 self(timer)를 강하게 가르키더라도 문제가 없음
    
    var number: Int = 0 //초 숫자 정수형태로 바꿔담음
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        //슬라이더 가운데 설정
        slider.value = 0.5
    }
    
    //슬라이더 값이 변할때마다 호출됨
    @IBAction func sliderChanged(_ sender: UISlider) {
        //슬라이더의 밸류값을 가지고 메인레이블의 텍스트를 셋팅
        number = Int(sender.value * 60) //sender로 슬라이더 접근가능
        mainLabel.text = "\(number)초"
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        //1초씩 지나갈때마다 무언가를 실행
        timer?.invalidate() //기존 실행되는 타이머 비활성화
        
        //selector 함수 실행 방법
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true) //userInfo: 정보전달. 일반적으로 없어서 nil
        
        //클로저 실행 방법
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in //[self]는 strong self와 동일. weak self로 선언 안해도 됨. 클로저 사용이 어려우면 selector로 다른 함수 사용하는게 더 나을수도 있음
            //반복하고 싶은 코드
            if number > 0 {
                self.number -= 1
                //슬라이더도 줄여야됨
                        slider.value = Float(number) / Float(60)
                        //레이블 표시 다시 해줘야함
                        mainLabel.text = "\(number)초"
                    } else {
                        number = 0
                        mainLabel.text = "초를 선택하세요"
                        timer?.invalidate()
                        //소리 나게 해야 함
                        AudioServicesPlayAlertSound(SystemSoundID(1322))
                    }
                }
    }
    
    @objc func doSomethingAfter1Second() {
        //반복하고 싶은 코드
        if number > 0 {
            self.number -= 1
            //슬라이더도 줄여야됨
            slider.value = Float(number) / Float(60)
            //레이블 표시 다시 해줘야함
            mainLabel.text = "\(number)초"
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            timer?.invalidate()
            //소리 나게 해야 함
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        //초기화 셋팅
        mainLabel.text = "초를 선택하세요"
        //슬라이더 가운데 위치로 설정
        //        slider.value = 0.5
        slider.setValue(0.5, animated: true) //애니메이션 추가
        number = 0
        //타이머 실행중일때 중지
        timer = nil //이렇게 타이머 비활성화도 가능
    }
    

}

