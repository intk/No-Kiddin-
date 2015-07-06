//
//  DetailViewController.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 01-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit
import MediaPlayer

class DetailViewController: UIViewController, UIViewControllerTransitioningDelegate {

    private var model: Art?
    private var viewModel: DetailViewModel?
    
    private var cornerView: CornerView?
    
    internal var titleLabel: UILabel?
    internal var avatarImageView: UIImageView?
    
    private var moviePlayer: MoviePlayerController?
    
    init(model: Art) {
        super.init(nibName: nil, bundle: nil)
        
        self.model = model
        
        modalPresentationStyle = .Custom
        transitioningDelegate = self
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blackColor()
        
        cornerView = CornerView()
        cornerView!.cornerViewItem = CornerViewItem(target: self, selector: Selector("dismissViewController"), image: UIImage(named: "Cross")!)
        view.addSubview(cornerView!)
        
        titleLabel = UILabel()
        titleLabel!.textAlignment = .Right
        titleLabel!.textColor = UIColor.whiteColor()
        view.addSubview(titleLabel!)
        
        avatarImageView = UIImageView()
        avatarImageView!.clipsToBounds = true
        view.addSubview(avatarImageView!)
        
        viewModel = DetailViewModel(viewController: self, model: model!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        cornerView?.frame = CGRect(x: 0, y: 0, width: 74, height: 76)
        
        titleLabel?.frame = CGRect(x: 75, y: 15, width: view.frame.width - 150 - 20, height: 60)
        
        avatarImageView?.frame = CGRect(x: view.frame.width - 75, y: 15, width: 60, height: 60)
        avatarImageView?.layer.cornerRadius = 30.0
        
        moviePlayer?.view.frame = view.bounds
        moviePlayer?.viewWillLayoutSubviews()
    }
    
    internal func playVideoFromUrl(url: NSURL) -> MPMoviePlayerController {
        moviePlayer = MoviePlayerController(contentURL: url)
        moviePlayer!.model = model!
        
        view.addSubview(moviePlayer!.view)
        view.sendSubviewToBack(moviePlayer!.view)
        
        moviePlayer!.play()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.removeObserver(self, name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer!)
        notificationCenter.addObserver(self, selector: Selector("moviePlayerDidFinish:"), name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer!)
        
        return moviePlayer!
    }
    
    internal func playVideoFromUrl(url: NSURL, withSubtitles subtitlesPath: String) -> MPMoviePlayerController {
        let moviePlayer = playVideoFromUrl(url)
        
        moviePlayer.openSRTFileAtPath(subtitlesPath, completion: { (finished) -> Void in
            moviePlayer.showSubtitles()
        }) { (error) -> Void in
            println(error.description)
        }
        
        return moviePlayer
    }
    
    internal func moviePlayerDidFinish(notification: NSNotification) {
        // Remove reference to prevent memory leak
        moviePlayer = nil
        
        // Dismiss ViewController after 2 minutes
        NSTimer.scheduledTimerWithTimeInterval(120.0, target: self, selector: Selector("dismissViewController"), userInfo: nil, repeats: false)
    }
    
    internal func dismissViewController() {
        moviePlayer?.stop()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeViewControllerTransition(isPresenting: true)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeViewControllerTransition(isPresenting: false)
    }
    
}
