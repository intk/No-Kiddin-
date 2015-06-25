//
//  DetailViewModel.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 01-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class DetailViewModel {
    
    init(viewController: DetailViewController, model: Art) {
        viewController.playVideoFromUrl(model.audioUrl, withSubtitles: model.subtitlesPath)
        viewController.avatarImageView?.image = model.avatarImage
        
        let defaultAttributes = [NSFontAttributeName: UIFont(name: "Toekomst-Medium", size: 14.0)!]
        let bookAttributes = [NSFontAttributeName: UIFont(name: "Toekomst-Book", size: 14.0)!, NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.7)]
        
        let attributedString = NSMutableAttributedString(string: "\(model.kidName!) over \(model.name!)", attributes: defaultAttributes)
        
        let bookRange = NSMakeRange(count(model.kidName!) + 1, 4)
        attributedString.addAttributes(bookAttributes, range: bookRange)
        
        viewController.titleLabel?.attributedText = attributedString
    }
    
}