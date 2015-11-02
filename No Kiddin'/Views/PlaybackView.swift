//
//  PlaybackView.swift
//  No Kiddin'
//
//  Created by Sjors Snoeren on 01-11-15.
//  Copyright © 2015 Sjors Snoeren. All rights reserved.
//

import UIKit
import MediaPlayer

extension UIView {
    
    func recursiveRemoveAllAnimations() {
        recursiveRemoveAllAnimations(self)
    }
    
    func recursiveRemoveAllAnimations(view: UIView) {
        view.layer.removeAllAnimations()
        
        for subview in view.subviews {
            recursiveRemoveAllAnimations(subview)
        }
    }
    
}

extension MPVolumeView {
    
    func slider() -> UISlider {
        for view in subviews {
            if view is UISlider {
                return view as! UISlider
            }
        }
        return UISlider()
    }
    
}

class PlaybackView: UIView {
    
    private var moviePlayerController: MPMoviePlayerController
    private var isScrubbing = false
    
    private var playButton: UIButton?
    private var playSlider: UISlider?
    private var playSliderUpdateTimer: NSTimer?
    
    private var volumeButton: UIButton?
    private var volumeView: MPVolumeView?
    
    private var previousVolume: Float?
    
    init(moviePlayerController: MPMoviePlayerController) {
        self.moviePlayerController = moviePlayerController
        
        super.init(frame: .zero)
        
        playButton = UIButton(type: .Custom)
        playButton!.setImage(UIImage(named: "Pause"), forState: .Normal)
        playButton!.addTarget(self, action: Selector("playButtonDidTouchUpInside:"), forControlEvents: .TouchUpInside)
        addSubview(playButton!)
        
        playSlider = UISlider()
        playSlider!.addTarget(self, action: Selector("playSliderDidStartScrubbing:"), forControlEvents: .TouchDragInside)
        playSlider!.continuous = false
        adjustSliderAppearance(playSlider!)
        addSubview(playSlider!)
        
        volumeButton = UIButton(type: .Custom)
        volumeButton!.contentHorizontalAlignment = .Left
        volumeButton!.addTarget(self, action: Selector("volumeButtonDidTouchUpInside:"), forControlEvents: .TouchUpInside)
        addSubview(volumeButton!)
        
        volumeView = MPVolumeView()
        volumeView!.showsRouteButton = false
        volumeView!.slider().addTarget(self, action: Selector("volumeViewDidChange:"), forControlEvents: .ValueChanged)
        adjustSliderAppearance(volumeView!.slider())
        addSubview(volumeView!)
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("playSliderShouldUpdate"), userInfo: nil, repeats: true)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func adjustSliderAppearance(slider: UISlider) {
        slider.setMaximumTrackImage(UIImage.imageWithColor(UIColor(white: 1.0, alpha: 0.3), size: CGSize(width: 3, height: 3)), forState: .Normal)
        slider.setMinimumTrackImage(UIImage.imageWithColor(UIColor.whiteColor(), size: CGSize(width: 3, height: 3)), forState: .Normal)
        slider.setThumbImage(UIImage.imageWithColor(UIColor.clearColor(), size: CGSize(width: 6, height: 6)), forState: .Normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let playButtonWidth: CGFloat = 30.0
        let volumeButtonWidth: CGFloat = 44.0
        let seperationSpace: CGFloat = 34.0
        
        let remainingSliderWidth: CGFloat = frame.width - playButtonWidth - volumeButtonWidth - seperationSpace
        
        if let playButton = playButton {
            playButton.frame = CGRect(x: -14.0, y: 0, width: playButtonWidth + 14.0, height: frame.height)
            
            if let playSlider = playSlider {
                playSlider.frame = CGRect(x: playButton.frame.origin.x + playButton.frame.width, y: 0, width: (remainingSliderWidth / 3) * 2, height: frame.height)
                
                if let volumeButton = volumeButton {
                    volumeButton.frame = CGRect(x: playSlider.frame.origin.x + playSlider.frame.width + seperationSpace, y: 0, width: volumeButtonWidth, height: frame.height)
                    
                    if let volumeView = volumeView {
                        volumeView.recursiveRemoveAllAnimations()
                        volumeView.frame = CGRect(x: volumeButton.frame.origin.x + volumeButton.frame.width, y: 12, width: (remainingSliderWidth / 3), height: frame.height)
                    }
                }
            }
        }
    }
    
    internal func playSliderShouldUpdate() {
        let progress: Float = Float(moviePlayerController.currentPlaybackTime / moviePlayerController.duration)
        
        if !isScrubbing {
            self.playSlider?.value = progress
        }
        isScrubbing = false
    }
    
    // MARK: - Events
    
    internal func playButtonDidTouchUpInside(sender: UIButton) {
        if moviePlayerController.playbackState != .Paused {
            moviePlayerController.pause()
            sender.setImage(UIImage(named: "Play"), forState: .Normal)
        } else {
            moviePlayerController.play()
            sender.setImage(UIImage(named: "Pause"), forState: .Normal)
        }
    }
    
    internal func playSliderDidStartScrubbing(sender: UISlider) {
        if moviePlayerController.playbackState == .Stopped {
            moviePlayerController.play()
        }
        
        moviePlayerController.currentPlaybackTime = (Double(sender.value) * moviePlayerController.duration)
        isScrubbing = true
    }
    
    internal func volumeButtonDidTouchUpInside(sender: UIButton) {
        let slider = volumeView!.slider()
        if slider.value > 0 {
            previousVolume = slider.value
            slider.value = 0.0
        } else {
            if let previousVolume = previousVolume {
                slider.value = previousVolume
            } else {
                slider.value = 1.0
            }
        }
    }
    
    internal func volumeViewDidChange(sender: UISlider) {
        if sender.value == 0 {
            volumeButton!.setImage(UIImage(named: "VolumeMute"), forState: .Normal)
        } else if sender.value < 0.5 {
            volumeButton!.setImage(UIImage(named: "Volume50"), forState: .Normal)
        } else {
            volumeButton!.setImage(UIImage(named: "Volume100"), forState: .Normal)
        }
    }
    
}