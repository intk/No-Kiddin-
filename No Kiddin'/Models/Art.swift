//
//  Art.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 01-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

enum ArtDisplayMode {
    case Light, Dark
}

class Art {
    
    // MARK: - Data
    
    internal var name: String?
    internal var kidName: String?
    internal var kidTintColor: UIColor?
    internal var displayMode: ArtDisplayMode = .Light
    
    // MARK: - Getters
    
    internal var portraitArtImage: UIImage {
        if let image = UIImage(named: "\(kidName!)-Art") {
            return image
        }
        return UIImage(named: "Nora-Art")!
    }
    
    internal var landscapeArtImage: UIImage {
        if let image = UIImage(named: "\(kidName!)-Art-Landscape") {
            return image
        }
        return UIImage(named: "Nora-Art-Landscape")!
    }
    
    internal var videoPath: String {
        return NSBundle.mainBundle().pathForResource(kidName!, ofType: "mov")!
    }
    
    internal var videoUrl: NSURL {
        return NSURL(fileURLWithPath: videoPath)!
    }
    
    internal var subtitlesPath: String {
        return NSBundle.mainBundle().pathForResource(kidName!, ofType: "srt")!
    }
    
    // MARK: - Kids
    
    internal var portraitKidImage: UIImage {
        return UIImage(named: kidName!)!
    }
    
    internal var landscapeKidImage: UIImage {
        return UIImage(named: "\(kidName!)-Landscape")!
    }
    
    internal var avatarImage: UIImage {
        return UIImage(named: "\(kidName!)-Avatar")!
    }
    
}