//
//  TailCell.swift
//  iglistkityogi
//
//  Created by mingyu beom on 2020/11/30.
//

import UIKit
//text
class TailCell: UICollectionViewCell {
    
    let txtView: UITextView = {
        let txtView = UITextView().then{
            $0.isEditable = false
            $0.font = UIFont.systemFont(ofSize: 14)
        }
        return txtView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func setupViews(){
        fillWith(txtView)
    }
}
