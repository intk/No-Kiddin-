//
//  MoviePlayerController.swift
//  No Kiddin'
//
//  Created by Sjors Snoeren on 10-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import MediaPlayer

class MoviePlayerController: MPMoviePlayerController {
    
    private var overlayImageView: UIImageView?
    private var displayAdjustmentView: UIView?
    
    internal var model: Art? {
        didSet {
            loadImage()
            
            if model!.displayMode == .Light {
                displayAdjustmentView?.backgroundColor = UIColor(white: 0, alpha: 0.1)
            } else {
                displayAdjustmentView?.backgroundColor = UIColor(white: 0, alpha: 0.2)
            }
        }
    }
    
    override init!(contentURL url: NSURL!) {
        super.init(contentURL: url)
        
        overlayImageView = UIImageView()
        overlayImageView!.backgroundColor = UIColor.blackColor()
        overlayImageView!.clipsToBounds = true
        view.addSubview(overlayImageView!)
        
        displayAdjustmentView = UIView()
        displayAdjustmentView!.backgroundColor = UIColor(white: 0, alpha: 0.1)
        view.addSubview(displayAdjustmentView!)
    }
    
    internal func didSetFrame() {
//        overlayImageView?.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 44)
        overlayImageView?.frame = view.bounds
        displayAdjustmentView?.frame = view.bounds
        
        loadImage()
    }
    
    private func loadImage() {
        if overlayImageView?.bounds.width < overlayImageView?.bounds.height {
            overlayImageView?.image = model!.portraitArtImage
        } else {
            overlayImageView?.image = model!.landscapeArtImage
        }
    }
    
}
