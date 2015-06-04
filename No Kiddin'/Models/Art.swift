//
//  Art.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 01-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class Art {
    
    // MARK: - Data
    
    internal var name: String?
    internal var kidName: String?
    internal var tintColor: UIColor?
    
    // MARK: - Getters
    
    internal var portraitImage: UIImage {
        return UIImage(named: kidName!)!
    }
    
    internal var landscapeImage: UIImage {
        return UIImage(named: "\(kidName!)-Landscape")!
    }
    
    internal var avatarImage: UIImage {
        return UIImage(named: "\(kidName!)-Avatar")!
    }
    
    internal var videoPath: String {
        if let path = NSBundle.mainBundle().pathForResource(kidName!, ofType: "mov") {
            return path
        }
        return NSBundle.mainBundle().pathForResource("Bodil", ofType: "mov")!
    }
    
    internal var videoUrl: NSURL {
        return NSURL(fileURLWithPath: videoPath)!
    }
    
    internal var subtitlesPath: String {
        return NSBundle.mainBundle().pathForResource("Bodil", ofType: "srt")!
    }
    
}