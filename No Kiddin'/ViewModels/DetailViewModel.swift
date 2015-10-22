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
        let italicAttributes = [
            NSObliquenessAttributeName: 0.2,
            NSFontAttributeName: UIFont(name: "Toekomst-Medium", size: 14.0)!,
        ]
        
        let ageString = "(\(model.kidAge!))"
        let attributedString = NSMutableAttributedString(string: "\(model.kidName!) \(ageString) over \(model.name!)", attributes: defaultAttributes)
        
        let bookRange = NSMakeRange(model.kidName!.characters.count + ageString.characters.count + 2, 4)
        attributedString.addAttributes(bookAttributes, range: bookRange)
        
        var artworkNameComponents = model.name?.componentsSeparatedByString(",")
        artworkNameComponents?.popLast()
        let artworkTitle = artworkNameComponents!.joinWithSeparator(",")
        
        let italicRange = NSMakeRange(bookRange.location + bookRange.length, artworkTitle.characters.count + 1)
        attributedString.addAttributes(italicAttributes, range: italicRange)
        
        viewController.titleLabel?.attributedText = attributedString
    }
    
}