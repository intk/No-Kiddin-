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
    private var imageName: String?
    
    private var artSize: CGSize?
    internal var model: Art? {
        didSet {
            artSize = model!.artSize!
            overlayScrollView = JCTiledScrollView(frame: CGRect.zeroRect, contentSize: artSize!)
            overlayScrollView!.scrollView!.backgroundColor = UIColor.blackColor()
            overlayScrollView!.dataSource = self
            overlayScrollView!.levelsOfDetail = 1
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
//            overlayScrollView.contentSize = overlayScrollView.frame.size
//            overlayImageView?.frame = overlayScrollView.bounds
        }
        
        displayAdjustmentView?.frame = view.bounds
        
        adjustImage()
    }
    
    internal func tiledScrollView(scrollView: JCTiledScrollView!, imageForRow row: Int, column: Int, scale: Int) -> UIImage! {
        let fileName: String = "\(model!.kidName!)_\(row)_\(column)";
        return UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(fileName, ofType: "jpg")!)!
    }
    
}
