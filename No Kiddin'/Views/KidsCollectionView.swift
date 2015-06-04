//
//  KidsCollectionView.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 02-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class KidsCollectionViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class KidsAnimatableCollectionView: UICollectionView {
    
    // MARK: - Contants
    
    private let maxVisibleTintViews: Int = 3
    private let animationTimerDuration: Double = 1.0
    private let animationDuration: Double = 0.8
    
    // MARK: - Private
    
    private var timer: NSTimer?
    private var visibleTintViewIndexes: Array<Int> = Array<Int>()
    
    // MARK: - Animations
    
    internal func startAnimating() {
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(animationTimerDuration, target: self, selector: Selector("willAnimate"), userInfo: nil, repeats: true)
    }
    
    internal func willAnimate() {
        
        // Find a random index to fadeIn
        let fadeInCellIndex = Int.rand(numberOfItems(), notIn: visibleTintViewIndexes)
        visibleTintViewIndexes.append(fadeInCellIndex)
        
        // FadeIn a new cell
        let fadeInCell = cellForItemAtIndexPath(NSIndexPath(forItem: fadeInCellIndex, inSection: 0)) as! KidCollectionViewCell
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            fadeInCell.tintView?.alpha = 0.5
        })
        
        // FadeOut an exising cell after 3 fadeIns
        if visibleTintViewIndexes.count == maxVisibleTintViews {
            let fadeOutCell = cellForItemAtIndexPath(NSIndexPath(forItem: visibleTintViewIndexes[0], inSection: 0)) as! KidCollectionViewCell
            visibleTintViewIndexes.removeAtIndex(0)
            
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                fadeOutCell.tintView?.alpha = 0.0
            })
        }
    }
    
    internal func stopAnimating() {
        timer?.invalidate()
    }
    
    // MARK: - Helpers
    
    private func numberOfItems() -> Int {
        return numberOfItemsInSection(0)
    }
    
}
