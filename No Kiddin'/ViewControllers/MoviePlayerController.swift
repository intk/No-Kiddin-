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
    
    private var playbackView: PlaybackView?
    private var displayAdjustmentView: UIView?
    
    private var artSize: CGSize?
    internal var model: Art? {
        didSet {
            controlStyle = .None
            
            artSize = CGSize(width: floor(model!.artSize!.width / 4) - 2.0, height: floor(model!.artSize!.height / 4) - 2.0)
            overlayScrollView = JCTiledScrollView(frame: .zero, contentSize: artSize!)
            overlayScrollView!.scrollView!.backgroundColor = UIColor.blackColor()
            overlayScrollView!.dataSource = self
            overlayScrollView!.zoomScale = 1
            overlayScrollView!.levelsOfZoom = 3
            overlayScrollView!.levelsOfDetail = 3
            view.addSubview(overlayScrollView!)
            
            overlayScrollView!.scrollView!.contentOffset = CGPoint(x: artSize!.height / 2.0, y: artSize!.width / 2.0)
            
            playbackView = PlaybackView(moviePlayerController: self)
            view.addSubview(playbackView!)
            
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
            overlayScrollView!.scrollView!.setZoomScale(min(heightRatio, widthRatio), animated: false)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let contentFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        if let overlayScrollView = overlayScrollView {
            overlayScrollView.frame = contentFrame
        }
        
        playbackView?.frame = CGRect(x: 34, y: view.frame.height - 20 - 44, width: view.frame.width - (34 * 2), height: 44)
        
        displayAdjustmentView?.frame = contentFrame
    }
    
    internal func viewDidLayoutSubviews() {
        adjustImage()
    }
    
    internal func tiledScrollView(scrollView: JCTiledScrollView!, imageForRow row: Int, column: Int, scale: Int) -> UIImage! {
        let fileName = String(format: "%@-Art_\(scale)x_%02d_%02d", arguments: [model!.kidName!, row, column])
        print(fileName)
        if let image = UIImage(named: fileName) {
            return image
        }
        return UIImage(named: "Placeholder")!
    }
    
}
