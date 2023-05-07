//
//  ForthViewController.swift
//  NextVC
//
//  Created by Deokhun KIM on 2023/05/04.
//

import UIKit

class ForthViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString

    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
