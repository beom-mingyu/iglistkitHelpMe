//
//  PhotoPagerCell.swift
//  iglistkityogi
//
//  Created by mingyu beom on 2020/11/30.
//

import UIKit
import FSPagerView
import Then

class PhotoPagerCell: UICollectionViewCell {
    
    var images : [String] = []
    
    let photoPagerView: FSPagerView = {
        var photoPagerView = FSPagerView()
        photoPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        photoPagerView.itemSize = photoPagerView.frame.size.applying(CGAffineTransform(scaleX: 0.9, y: 0.9))
        photoPagerView.interitemSpacing = 10
        photoPagerView.translatesAutoresizingMaskIntoConstraints = false
        return photoPagerView
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        contentView.addSubview(photoPagerView)
        photoPagerView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        photoPagerView.dataSource = self
        photoPagerView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}


extension PhotoPagerCell: FSPagerViewDataSource,FSPagerViewDelegate {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.images.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index).then{
            $0.contentView.layer.shadowRadius = 0 //shadowOff
            $0.imageView?.contentMode = .scaleAspectFill
            $0.imageView?.clipsToBounds = true
            $0.imageView?.layer.cornerRadius = 5
            //get photo from document storage
//            let provider = UIImage.getImageProviderFromDocumentDirectory(imageName: self.images[index])
            //$0.imageView?.kf.setImage(with: provider) //
            
        }
        return cell
    }
}
