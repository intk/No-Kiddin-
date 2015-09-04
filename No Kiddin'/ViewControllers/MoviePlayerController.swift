//
//  MoviePlayerController.swift
//  No Kiddin'
//
//  Created by Sjors Snoeren on 10-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import MediaPlayer

class MoviePlayerController: MPMoviePlayerController, JCTileSource, UIScrollViewDelegate {
    
    private var overlayScrollView: JCTiledScrollView?
    
    private var displayAdjustmentView: UIView?
    
    private var artSize: CGSize?
    internal var model: Art? {
        didSet {
            artSize = CGSize(width: floor(model!.artSize!.width / 4), height: floor(model!.artSize!.height / 4))
            overlayScrollView = JCTiledScrollView(frame: CGRect.zeroRect, contentSize: artSize!)
            overlayScrollView!.scrollView!.backgroundColor = UIColor.blackColor()
            overlayScrollView!.dataSource = self
            overlayScrollView!.zoomScale = 1
            overlayScrollView!.levelsOfZoom = 3
            overlayScrollView!.levelsOfDetail = 3
            view.addSubview(overlayScrollView!)
            
            overlayScrollView!.scrollView!.contentOffset = CGPoint(x: artSize!.height / 2.0, y: artSize!.width / 2.0)
            
            displayAdjustmentView = UIView()
            displayAdjustmentView!.backgroundColor = UIColor(white: 0, alpha: 0.1)
            displayAdjustmentView!.userInteractionEnabled = false
            view.addSubview(displayAdjustmentView!)
            
            if model!.displayMode == .Light {
                displayAdjustmentView?.backgroundColor = UIColor(white: 0, alpha: 0.1)
            } else {
                displayAdjustmentView?.backgroundColor = UIColor(white: 0, alpha: 0.2)
            }
        }
    }
    
    private func adjustImage() {
        if let artSize = artSize {
            let widthRatio: CGFloat = UIScreen.mainScreen().bounds.size.width / artSize.width
            let heightRatio: CGFloat = UIScreen.mainScreen().bounds.size.height / artSize.height
            
            overlayScrollView!.scrollView!.minimumZoomScale = min(heightRatio, widthRatio)
            overlayScrollView!.scrollView!.setZoomScale(max(heightRatio, widthRatio), animated: false)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        if let overlayScrollView = overlayScrollView {
            overlayScrollView.frame = view.bounds
        }
        
        displayAdjustmentView?.frame = view.bounds
        
        adjustImage()
    }
    
    internal func tiledScrollView(scrollView: JCTiledScrollView!, imageForRow row: Int, column: Int, scale: Int) -> UIImage! {
        let fileName = String(format: "%@-Art_\(scale)x_%02d_%02d", arguments: [model!.kidName!, row, column])
        println(fileName)
        return UIImage(named: fileName)!
    }
    
}
