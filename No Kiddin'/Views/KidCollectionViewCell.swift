//
//  KidCollectionViewCell.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 01-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class KidCollectionViewCell: UICollectionViewCell {
    
    var model: Art? {
        didSet {
            tintView?.layer.borderColor = model!.tintColor!.CGColor
            imageView?.image = model?.portraitImage
        }
    }
    
    private var imageView: UIImageView?
    
    internal var tintView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView!.contentMode = UIViewContentMode.ScaleAspectFill
        imageView!.clipsToBounds = true
        addSubview(imageView!)
        
        tintView = UIView()
        tintView!.layer.borderWidth = 5
        tintView!.alpha = 0
        addSubview(tintView!)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        if bounds.width < bounds.height {
            imageView?.image = model!.portraitImage
        } else {
            imageView?.image = model!.landscapeImage
        }
        
        imageView?.frame = bounds
        tintView?.frame = CGRect(x: 20, y: 20, width: frame.width - 40, height: frame.height - 40)
    }
    
}