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
    
    internal var artSize: CGSize?
    internal var displayMode: ArtDisplayMode = .Light
    
    // MARK: - Getters
    
    internal var artName: String {
        return "\(self.kidName!)-Art"
    }
    
    internal var audioPath: String {
        if let video = NSBundle.mainBundle().pathForResource(kidName!, ofType: "mp3") {
            return video
        }
        return NSBundle.mainBundle().pathForResource("Bodil", ofType: "mp3")!
    }
    
    internal lazy var audioUrl: NSURL = {
        return NSURL(fileURLWithPath: self.audioPath)!
    }()
    
    internal var videoPath: String {
        if let video = NSBundle.mainBundle().pathForResource(kidName!, ofType: "mov") {
            return video
        }
        return NSBundle.mainBundle().pathForResource("Nora", ofType: "mov")!
    }
    
    internal var videoUrl: NSURL {
        return NSURL(fileURLWithPath: videoPath)!
    }
    
    internal var subtitlesPath: String {
        if let subtitlesPath = NSBundle.mainBundle().pathForResource(kidName!, ofType: "srt") {
            return subtitlesPath
        }
        return NSBundle.mainBundle().pathForResource("Nora", ofType: "srt")!
    }
    
    // MARK: - Kids
    
    internal var portraitKidImage: UIImage {
        if let image = UIImage(named: kidName!) {
            return image
        }
        return UIImage(named: "Nora")!
    }
    
    internal var landscapeKidImage: UIImage {
        if let image = UIImage(named: "\(kidName!)-Landscape") {
            return image
        }
        return UIImage(named: "Nora-Landscape")!
    }
    
    internal var avatarImage: UIImage {
        if let image = UIImage(named: "\(kidName!)-Avatar") {
            return image
        }
        return UIImage(named: "Nora-Avatar")!
    }
    
}