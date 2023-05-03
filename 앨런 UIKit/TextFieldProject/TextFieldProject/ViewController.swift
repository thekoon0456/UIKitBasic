//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Deokhun KIM on 2023/05/02.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { //1. 프로토콜 채택

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2. UITextFieldDelegate 채택
        textField.delegate = self //self는 뷰컨트롤러
        
        setUp()
    }
    
    func setUp() {
        view.backgroundColor = .gray
        textField.placeholder = "이메일 입력"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .next
    }
    
    //실제 메서드 구현하면서 텍스트필드의 작동 시점을 전달받을 수 있음
    //UITextFieldDelegate 채택. 선택사항 메서드. 텍스트 필드의 입력을 시작할때 호출되는 메서드
    //(시작할지 말지의 여부 허락하는것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function) //실행시 함수의 이름이 출력됨
        return true
    }
    
    //bool 리턴아님. 시점을 의미. 입력이 시작되는 시점을 알려줌
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function) //실행시 함수의 이름이 출력됨
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    //should 허락할지말지. 어떤 조건이 되면 전체삭제 할지말지. false시 x버튼 눌러도 동작안함
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function) //실행시 함수의 이름이 출력됨
        return false
    }
    
    //텍스트 필드의 글자 내용이 한글자 한글자 입력되거나 지워질때 호출되고, 입력 허락 여부 판단
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function) //실행시 함수의 이름이 출력됨
        //구글링한 코드
//        let maxLength = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
//        return newString.length <= maxLength
        
        //10글자 이상 입력 막는 코드
        if (textField.text?.count ?? 0) + string.count > 10 {
            return false
        } else {
            return true
        }
        
        //숫자의 경우 입력 허용하지 않는 코드
        if Int(string) != nil {
            return false
        } else {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
        
    }
    
    //엔터가 눌러지면 다음 동작을 허락할건지 말건지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function) //실행시 함수의 이름이 출력됨
        
        if textField.text == "" {
            textField.placeholder = "Type Sonething!"
            return false
        } else {
            return true
        }
    }
    
    //텍스트필드의 입력이 끝날때 호출. 끝날지 말지 허락
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function) //실행시 함수의 이름이 출력됨
        return true
    }
    
    //텍스트필드 입력이 실제로 끝났을때 호출. (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function) //실행시 함수의 이름이 출력됨
        print("유저가 텍스트필드의 입력을 끝냄")
        textField.text = ""
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
    

}

