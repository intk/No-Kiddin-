//
//  MoviePlayerController.swift
//  No Kiddin'
//
//  Created by Sjors Snoeren on 10-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import MediaPlayer

class MoviePlayerController: MPMoviePlayerController, UIScrollViewDelegate {
    
    private var overlayScrollView: UIScrollView?
    private var overlayImageView: UIImageView?
    
    private var displayAdjustmentView: UIView?
    
    internal var model: Art? {
        didSet {
            overlayImageView?.image = model!.portraitArtImage
            
            if model!.displayMode == .Light {
                displayAdjustmentView?.backgroundColor = UIColor(white: 0, alpha: 0.1)
            } else {
                displayAdjustmentView?.backgroundColor = UIColor(white: 0, alpha: 0.2)
            }
        }
    }
    
    override init!(contentURL url: NSURL!) {
        super.init(contentURL: url)
        
        overlayScrollView = UIScrollView()
        overlayScrollView!.delegate = self
        overlayScrollView!.minimumZoomScale = 1.0
        overlayScrollView!.maximumZoomScale = 6.0
        overlayScrollView!.backgroundColor = UIColor.blackColor()
        view.addSubview(overlayScrollView!)
        
        overlayImageView = UIImageView()
        overlayImageView!.backgroundColor = UIColor.clearColor()
        overlayImageView!.clipsToBounds = true
        overlayImageView!.contentMode = UIViewContentMode.ScaleAspectFit
        overlayScrollView!.addSubview(overlayImageView!)
        
        displayAdjustmentView = UIView()
        displayAdjustmentView!.backgroundColor = UIColor(white: 0, alpha: 0.1)
        displayAdjustmentView!.userInteractionEnabled = false
        view.addSubview(displayAdjustmentView!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if let overlayScrollView = overlayScrollView {
            overlayScrollView.frame = view.bounds
            overlayScrollView.contentSize = overlayScrollView.frame.size
            overlayImageView?.frame = overlayScrollView.bounds
        }
        
        displayAdjustmentView?.frame = view.bounds
    }
    
    // MARK: - UIScrollViewDelegate
    
    internal func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return overlayImageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        var top: CGFloat = 0.0
        var left: CGFloat = 0.0
        
        if overlayScrollView!.contentSize.width < overlayScrollView!.bounds.size.width {
            left = (overlayScrollView!.bounds.size.width - overlayScrollView!.contentSize.width) * 0.5;
        }
        if (overlayScrollView!.contentSize.height < overlayScrollView!.bounds.size.height) {
            top = (overlayScrollView!.bounds.size.height-overlayScrollView!.contentSize.height) * 0.5;
        }
        overlayScrollView!.contentInset = UIEdgeInsetsMake(top, left, top, left);
    }
    
    internal func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView!, atScale scale: CGFloat) {
        
    }
    
}
