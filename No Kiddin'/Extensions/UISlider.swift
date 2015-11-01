//
//  UISlider.swift
//  No Kiddin'
//
//  Created by Sjors Snoeren on 01-11-15.
//  Copyright © 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

extension UISlider {
    
    func tapAndSlide(gesture: UILongPressGestureRecognizer) {
        let pt = gesture.locationInView(self)
        let thumbWidth = self.thumbRect().size.width
        var value: Float = 0
        
        if (pt.x <= self.thumbRect().size.width / 2) {
            value = self.minimumValue
        } else if (pt.x >= self.bounds.size.width - thumbWidth / 2) {
            value = self.maximumValue
        } else {
            let percentage = Float((pt.x - thumbWidth / 2) / (self.bounds.size.width - thumbWidth))
            let delta = percentage * (self.maximumValue - self.minimumValue)
            value = self.minimumValue + delta
        }
        
        if (gesture.state == UIGestureRecognizerState.Began) {
            UIView.animateWithDuration(0.35, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut,
                animations: {
                    self.setValue(value, animated: true)
                    super.sendActionsForControlEvents(UIControlEvents.ValueChanged)
                }, completion: nil)
        } else {
            self.setValue(value, animated: false)
            super.sendActionsForControlEvents(UIControlEvents.ValueChanged)
        }
    }
    
    func thumbRect() -> CGRect {
        return self.thumbRectForBounds(self.bounds, trackRect: self.bounds, value: self.value)
    }
    
}