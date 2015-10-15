//
//  CornerView.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 02-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class CornerViewItem {
    
    internal var target: AnyObject
    internal var selector: Selector
    internal var image: UIImage
    internal var tintColor: UIColor
    
    init(target: AnyObject, selector: Selector, image: UIImage, tintColor: UIColor) {
        self.target = target
        self.selector = selector
        self.image = image
        self.tintColor = tintColor
    }
    
}

class CornerView: UIView {
    
    private var backgroundView: UIView?
    
    private var button: UIButton?
    internal var iconView: UIImageView?
    
    internal var cornerViewItem: CornerViewItem? {
        didSet {
            iconView?.image = cornerViewItem!.image.imageWithRenderingMode(.AlwaysTemplate)
            iconView?.tintColor = cornerViewItem!.tintColor
            button?.addTarget(cornerViewItem!.target, action: cornerViewItem!.selector, forControlEvents: .TouchUpInside)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView = UIImageView(image: UIImage(named: "Corner")!)
        addSubview(backgroundView!)
        
        button = UIButton(type: .Custom)
        addSubview(button!)

        iconView = UIImageView()
        iconView!.contentMode = .Center
        addSubview(iconView!)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView?.frame = bounds
        
        button?.frame = bounds
        iconView?.frame = CGRect(x: 9, y: 9, width: 25, height: 25)
    }
    
}