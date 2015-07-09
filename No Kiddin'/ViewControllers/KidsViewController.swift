//
//  KidsViewController.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 01-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit
import MediaPlayer

class KidsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private var viewModel: KidViewModel?
    
    internal var items: Array<Art> = Array<Art>() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private var collectionViewLayout: KidsCollectionViewLayout?
    private var collectionView: KidsAnimatableCollectionView?
    
    private var cornerView: CornerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collectionViewLayout = KidsCollectionViewLayout()
        
        collectionView = KidsAnimatableCollectionView(frame: CGRectZero, collectionViewLayout: collectionViewLayout!)
        collectionView!.backgroundColor = UIColor.whiteColor()
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(KidCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView!)
        
        cornerView = CornerView()
        cornerView!.cornerViewItem = CornerViewItem(target: self, selector: Selector("presentInfoViewController"), image: UIImage(named: "Info")!)
        view.addSubview(cornerView!)
        
        viewModel = KidViewModel(viewController: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView!.startAnimating()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        collectionView?.frame = view.bounds
        
        let itemWidth = view.frame.width / 4
        let itemHeight = view.frame.height / 4
        collectionViewLayout?.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        cornerView?.frame = CGRect(x: 0, y: 0, width: 74, height: 76)
    }
    
    internal func presentInfoViewController() {
        presentViewController(InfoViewController(), animated: true, completion: nil)
    }
    
    // MARK: - UICollectionViewDataSource
    
    internal          func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    internal func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! KidCollectionViewCell
        
        cell.model = items[indexPath.item]
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    internal func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        presentViewController(DetailViewController(model: items[indexPath.item]), animated: true, completion: nil)
    }
    
//    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
//        let indexPaths = collectionView.indexPathsForVisibleItems() as! Array<NSIndexPath>
//        for var i = 0; i < indexPaths.count; i++ {
//            let _indexPath = indexPaths[i]
//            
//            if indexPath.item != _indexPath.item {
//                let cell = collectionView.cellForItemAtIndexPath(_indexPath)
//                
//                UIView.animateWithDuration(0.3, animations: { () -> Void in
//                    cell!.alpha = 0.1
//                })
//            }
//        }
//    }
//    
//    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
//        let indexPaths = collectionView.indexPathsForVisibleItems() as! Array<NSIndexPath>
//        for var i = 0; i < indexPaths.count; i++ {
//            let cell = collectionView.cellForItemAtIndexPath(indexPaths[i])
//            
//            UIView.animateWithDuration(0.3, animations: { () -> Void in
//                cell!.alpha = 1.0
//            })
//        }
//    }
    
}
