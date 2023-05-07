//
//  ViewController.swift
//  BMI
//
//  Created by Deokhun KIM on 2023/05/04.
//

import UIKit

final class CodeViewController: UIViewController {
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "키와 몸무게를 입력해주세요"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.text = "키"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.text = "몸무게"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private let heightTextfield: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    private let weightTextfield: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    private lazy var heightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heightLabel, heightTextfield])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()

    private lazy var weightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weightLabel, weightTextfield])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var wholeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainLabel, heightStackView, weightStackView])
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightTextfield.delegate = self
        weightTextfield.delegate = self
        configureUI()
    }

    func configureUI() {
        view.addSubview(wholeStackView)
        
        wholeStackView.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        heightStackView.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightTextfield.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wholeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            wholeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            wholeStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
//            heightStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            weightStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }

}

extension CodeViewController: UITextFieldDelegate {
    
}

