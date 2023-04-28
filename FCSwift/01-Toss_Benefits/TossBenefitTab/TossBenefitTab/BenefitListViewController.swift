//
//  BenefitListViewController.swift
//  TossBenefitTab
//
//  Created by Deokhun KIM on 2023/03/15.
//

import UIKit

class BenefitListViewController: UIViewController {
    //유저 스토리
    //기획, 디자인 -> 설계 -> 
    //사용자는 포인트를 볼 수 있다.
    //사용자는 오늘의 혜택을 볼 수 있다.
    //사용자는 나머지 혜택 리스트를 볼 수 있다.
    
    //사용자는 포인트 셀을 눌렀을때, 포인트 상세 뷰로 넘어간다
    //사용자는 혜택관련 셀을 눌렀을때, 혜택 상세 뷰로 넘어간다
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "혜택"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
