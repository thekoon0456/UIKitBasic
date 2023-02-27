//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by Deokhun KIM on 2022/07/19.
//

import UIKit

class FocusCell: UICollectionViewCell {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    //백그라운드 컬러 넣기 - 셀의 파일이 스토리보드에서 깨어났을때 (awakeFromNib)
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        //컨텐츠뷰 배경 인디고 색으로
        contentView.layer.cornerRadius = 10
        //셀 코너 10정도 둥그렇게 깎음
    }
    func configure(_ item: Focus) {
        titleLable.text = item.title
        descriptionLable.text = item.description
        thumbnailImageView.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal) //렌더링을 항상 오리지넝(멀티컬러)로 보이게 해라 (기본 디폴트값은 .alwaysTemplate) //template: 컬러 기본 틴트값 쓰고 형태만 가져옴
    }
    
}
