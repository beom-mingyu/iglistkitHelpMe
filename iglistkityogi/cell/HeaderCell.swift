//
//  HeaderCell.swift
//  iglistkityogi
//
//  Created by mingyu beom on 2020/11/30.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(dateLabel)
        dateLabel.frame = bounds.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
