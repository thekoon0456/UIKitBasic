//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by Deokhun KIM on 2022/07/14.
//

import UIKit

//ViewController: 페이지를 담당하는 코드
class SymbolRollerViewController: UIViewController {

    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lable: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() { //페이지가 스크린에 보일때 필요한 뷰에 대한 컴포넌트들이 메모리에 로드됨, 어떤 값들을 입혀줄 수 있음. (앱이 뜰때 viewdidload를 거쳐서 뜸) (화면 준비)
        super.viewDidLoad()
        reload() //여기 함수 넣어야 첫 화면부터 설정한 화면이 뜸
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    } //화면 보여질꺼야
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    } //화면 보여졌다
    
    @IBAction func buttonTapped(_ sender: Any) {
        //버튼 클릭했을때 랜덤으로 뜨도록 구현
        reload()
    }
    //Dry - 중복코드 메소드로 따서 호출
    func reload() {
        //To-Do
        //- 심볼에서 하나를 임의로 추출해서, 이미지와 텍스트를 설정한다.
        let symbol = symbols.randomElement()!
        // symbol은 옵셔널 값이지만 위에 symbols 배열 값은 확실히 있으므로 !로 표시(언래핑)
        imageView.image = UIImage(systemName: symbol)
        //이미지뷰에 랜덤으로 나온 symbol 이미지 뜨도록
        lable.text = symbol
        //레이블에 랜덤으로 나온 symbol 값 뜨도록
    }
}

// *중복되는 코드는 함수로 만들어 주면 가져다쓰기 쉬움! (Dry (Do not repeat yourself))
