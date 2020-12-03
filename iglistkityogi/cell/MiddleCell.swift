//
//  MiddleCell.swift
//  iglistkityogi
//
//  Created by mingyu beom on 2020/11/30.
//

import UIKit
import SnapKit

//#
class MiddleCell: UICollectionViewCell {
    
    let tagsLabel: UILabel = {
      let label = UILabel()
      return label
    }()

    let emojisLabel: UILabel = {
      let label = UILabel()
      return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagsLabel)
        tagsLabel.sizeToFit()
        tagsLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(contentView.snp.leading)
            make.centerY.equalTo(contentView)
            make.height.equalTo(contentView.bounds.height)
        }
        
        contentView.addSubview(emojisLabel)
        emojisLabel.sizeToFit()
        emojisLabel.snp.makeConstraints{ (make) -> Void in
            make.leading.equalTo(tagsLabel.snp.trailing).offset(8)
            make.centerY.equalTo(contentView)
            make.height.equalTo(contentView.bounds.height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}



