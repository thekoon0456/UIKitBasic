//
//  DetailViewController.swift
//  TableView
//
//  Created by Deokhun KIM on 2023/05/09.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI() {
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieTitle
        descriptionLabel.text = movieData?.movieDesciption
    }
    
}
 
