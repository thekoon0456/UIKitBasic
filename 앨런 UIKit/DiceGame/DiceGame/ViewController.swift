//
//  ViewController.swift
//  DiceGame
//
//  Created by Deokhun KIM on 2023/04/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image = diceArray[1]
        secondImageView.image = diceArray[1]
    }

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        //첫번째 이미지뷰의 이미지를 랜덤으로 변경
        //두번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
        
    }
    
    

}

