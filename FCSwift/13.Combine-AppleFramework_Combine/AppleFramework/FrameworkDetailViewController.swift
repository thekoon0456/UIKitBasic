//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by Deokhun KIM on 2023/03/03.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
//    @Published var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    var subscription = Set<AnyCancellable>()
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "unknown", imageName: "", urlString: "", description: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    private func bind() {
        //input: 버튼 클릭했을때
        //framework -> url -> safari -> present
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) }
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }.store(in: &subscription)
        
        //output: Data세팅될때 UI업데이트 (전달받은 프레임워크의 정보를 뿌려줌)
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscription)
    }

    @IBAction func learnMoreTapped(_ sender: Any) {
        buttonTapped.send(framework.value)
    }
}
