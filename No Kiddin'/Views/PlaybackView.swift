//
//  PlaybackView.swift
//  No Kiddin'
//
//  Created by Sjors Snoeren on 01-11-15.
//  Copyright © 2015 Sjors Snoeren. All rights reserved.
//

import UIKit
import MediaPlayer

protocol PlaybackViewTimelineSliderDelegate {
    
    func playbackViewTimelineSliderDidBeganTouches(playbackViewTimelineSlider: PlaybackViewTimelineSlider)
    func playbackViewTimelineSliderDidEndTouches(playbackViewTimelineSlider: PlaybackViewTimelineSlider)
    
}

class TrackImage: UIImage {
    
    class func minimumImage() -> UIImage {
        return UIImage(named: "MinimumSliderTrack")!.resizableImageWithCapInsets(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), resizingMode: UIImageResizingMode.Stretch)
    }
    
    class func maximumImage() -> UIImage {
        return UIImage(named: "MaximumSliderTrack")!.resizableImageWithCapInsets(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10), resizingMode: UIImageResizingMode.Stretch)
    }
    
}

class PlaybackViewSlider: UISlider {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setMinimumTrackImage(TrackImage.minimumImage(), forState: .Normal)
        setMaximumTrackImage(TrackImage.maximumImage(), forState: .Normal)
        setThumbImage(UIImage(named: "Circle"), forState: .Normal)
        setThumbImage(UIImage(named: "CircleTouch"), forState: .Highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class PlaybackViewTimelineSlider: PlaybackViewSlider {
    
    internal var delegate: PlaybackViewTimelineSliderDelegate?
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        delegate?.playbackViewTimelineSliderDidBeganTouches(self)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        delegate?.playbackViewTimelineSliderDidEndTouches(self)
    }
    
}

class PlaybackViewVolumeView: MPVolumeView {
    
    internal var slider: UISlider {
        for view in subviews {
            if view is UISlider {
                return view as! UISlider
            }
        }
        return UISlider()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setMinimumVolumeSliderImage(TrackImage.minimumImage(), forState: .Normal)
        setMaximumVolumeSliderImage(TrackImage.maximumImage(), forState: .Normal)
        setVolumeThumbImage(UIImage(named: "Circle"), forState: .Normal)
        setVolumeThumbImage(UIImage(named: "CircleTouch"), forState: .Highlighted)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        recursiveRemoveAllAnimationsForView(self)
    }
    
    private func recursiveRemoveAllAnimationsForView(view: UIView) {
        view.layer.removeAllAnimations()
        
        for subview in view.subviews {
            recursiveRemoveAllAnimationsForView(subview)
        }
    }
    
}

class PlaybackView: UIView, PlaybackViewTimelineSliderDelegate {
    
    private var moviePlayerController: MPMoviePlayerController
    
    private var playButton: UIButton?
    private var timelineSlider: PlaybackViewTimelineSlider?
    private var timelineSliderUpdateTimer: NSTimer?
    
    private var volumeButton: UIButton?
    private var volumeView: PlaybackViewVolumeView?
    
    private var previousVolume: Float?
    
    init(moviePlayerController: MPMoviePlayerController) {
        self.moviePlayerController = moviePlayerController

        super.init(frame: .zero)

        playButton = UIButton(type: .Custom)
        playButton!.setImage(UIImage(named: "Pause"), forState: .Normal)
        playButton!.addTarget(self, action: Selector("playButtonDidTouchUpInside:"), forControlEvents: .TouchUpInside)
        addSubview(playButton!)
        
        timelineSlider = PlaybackViewTimelineSlider()
        timelineSlider!.delegate = self
        timelineSlider!.continuous = false
        addSubview(timelineSlider!)
        
        volumeButton = UIButton(type: .Custom)
        volumeButton!.contentHorizontalAlignment = .Left
        volumeButton!.addTarget(self, action: Selector("volumeButtonDidTouchUpInside:"), forControlEvents: .TouchUpInside)
        addSubview(volumeButton!)
        
        volumeView = PlaybackViewVolumeView()
        volumeView!.showsRouteButton = false
        volumeView!.slider.addTarget(self, action: Selector("volumeViewDidChange:"), forControlEvents: .ValueChanged)
        addSubview(volumeView!)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: Selector("moviePlayerDidChangeState:"), name: MPMoviePlayerPlaybackStateDidChangeNotification, object: moviePlayerController)
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timelineSliderShouldUpdate"), userInfo: nil, repeats: true)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let playButtonWidth: CGFloat = 30.0
        let volumeButtonWidth: CGFloat = 44.0
        let seperationSpace: CGFloat = 34.0
        let sliderInnerSpace: CGFloat = 10.0
        
        let remainingSliderWidth: CGFloat = frame.width - playButtonWidth - volumeButtonWidth - seperationSpace
        
        if let playButton = playButton {
            playButton.frame = CGRect(x: -15.0, y: 0, width: playButtonWidth + 15.0, height: frame.height)
            
            if let timelineSlider = timelineSlider {
                timelineSlider.frame = CGRect(x: playButton.frame.origin.x + playButton.frame.width - sliderInnerSpace, y: 0, width: (remainingSliderWidth / 3) * 2 + (2 * sliderInnerSpace), height: frame.height)
                
                if let volumeButton = volumeButton {
                    volumeButton.frame = CGRect(x: timelineSlider.frame.origin.x + timelineSlider.frame.width + seperationSpace - sliderInnerSpace, y: 0, width: volumeButtonWidth, height: frame.height)
                    
                    if let volumeView = volumeView {
                        volumeView.frame = CGRect(x: volumeButton.frame.origin.x + volumeButton.frame.width - sliderInnerSpace, y: 12, width: (remainingSliderWidth / 3) + (2 * sliderInnerSpace), height: frame.height)
                    }
                }
            }
        }
    }
    
    internal func timelineSliderShouldUpdate() {
        if moviePlayerController.playbackState == .Playing {
            self.timelineSlider?.value = Float(moviePlayerController.currentPlaybackTime / moviePlayerController.duration)
        }
    }
    
    internal func moviePlayerDidChangeState(notification: NSNotification) {
        let moviePlayerController = notification.object as! MPMoviePlayerController
        
        if moviePlayerController.playbackState == .Paused {
            playButton?.setImage(UIImage(named: "Play"), forState: .Normal)
        } else {
            playButton?.setImage(UIImage(named: "Pause"), forState: .Normal)
        }
    }
    
    // MARK: - PlaybackViewTimelineSliderDelegate
    
    internal func playbackViewTimelineSliderDidBeganTouches(playbackViewTimelineSlider: PlaybackViewTimelineSlider) {
        moviePlayerController.pause()
    }
    
    internal func playbackViewTimelineSliderDidEndTouches(playbackViewTimelineSlider: PlaybackViewTimelineSlider) {
        moviePlayerController.play()
        moviePlayerController.currentPlaybackTime = (Double(playbackViewTimelineSlider.value) * moviePlayerController.duration)
    }
    
    // MARK: - Events
    
    internal func playButtonDidTouchUpInside(sender: UIButton) {
        if moviePlayerController.playbackState != .Paused {
            moviePlayerController.pause()
        } else {
            moviePlayerController.play()
        }
    }
    
    // MARK: - Volume Button
    
    internal func volumeButtonDidTouchUpInside(sender: UIButton) {
        let slider = volumeView!.slider
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