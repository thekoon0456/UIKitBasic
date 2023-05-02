//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Deokhun KIM on 2023/05/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
    

}

