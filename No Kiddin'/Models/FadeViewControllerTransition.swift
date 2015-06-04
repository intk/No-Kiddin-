//
//  FadeViewControllerTransition.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 02-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class FadeViewControllerTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    internal var isPresenting: Bool = false
    
    init(isPresenting: Bool) {
        super.init()
    
        self.isPresenting = isPresenting
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        if isPresenting {
            fromViewController.view.userInteractionEnabled = false
            toViewController.view.alpha = 0.0
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                toViewController.view.alpha = 1.0
            })
            
            transitionContext.containerView().addSubview(fromViewController.view)
            transitionContext.containerView().addSubview(toViewController.view)
            
            transitionContext.completeTransition(true)
        } else {
            toViewController.view.userInteractionEnabled = true
            toViewController.view.alpha = 0.0
            
            transitionContext.containerView().addSubview(fromViewController.view)
            transitionContext.containerView().addSubview(toViewController.view)
            
            UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
                toViewController.view.alpha = 1.0
            }, completion: { (finished) -> Void in
                transitionContext.completeTransition(true)
                
                UIApplication.sharedApplication().keyWindow!.addSubview(fromViewController.view)
                UIApplication.sharedApplication().keyWindow!.addSubview(toViewController.view)
            })
        }
    }
    
}