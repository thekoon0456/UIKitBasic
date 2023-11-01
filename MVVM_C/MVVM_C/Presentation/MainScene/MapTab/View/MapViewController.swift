//
//  MapViewController.swift
//  MVVM_C
//
//  Created by Deokhun KIM on 10/29/23.
//

import UIKit

protocol MapViewControllerDelegate: AnyObject {
    
}

class MapViewController: UIViewController {
    
    var viewModel: MapViewModel?
    weak var delegate: MapViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController 등장")
    }
    
    deinit {
        print("MapViewController 해제")
    }

}
