//
//  InfoViewController.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 02-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UIViewControllerTransitioningDelegate {

    private var cornerView: CornerView?
    
    private var contentView: UIView?
    
    private var infoTitleLabel: UILabel?
    private var infoTextView: UITextView?
    
    private var summaryTitleLabel: UILabel?
    private var summaryTextView: UITextView?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        modalPresentationStyle = .Custom
        transitioningDelegate = self
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.9)
        
        cornerView = CornerView()
        cornerView!.cornerViewItem = CornerViewItem(target: self, selector: Selector("dismissViewController"), image: UIImage(named: "Cross")!)
        view.addSubview(cornerView!)
        
        contentView = UIView()
        view.addSubview(contentView!)
        
        infoTitleLabel = UILabel()
        infoTitleLabel!.font = UIFont(name: "Toekomst-Book", size: 14.0)
        infoTitleLabel!.text = "Informatie over de app"
        infoTitleLabel!.textColor = UIColor(rgba: "#009CFF")
        contentView!.addSubview(infoTitleLabel!)
        
        infoTextView = UITextView()
        infoTextView!.backgroundColor = UIColor.clearColor()
        infoTextView!.font = UIFont(name: "Toekomst-Book", size: 14.0)
        infoTextView!.text = "Children have a distinct way of looking; they see different things from adults, and often perceive striking connections and inspiring analogies that grown-ups miss. The museum aims to incorporates their way of seeing into an easy to use iPad app. Children and young people aged from 5 to 17 recount their reactions to the works of art. The older the works of art become, the older the children providing the commentary."
        infoTextView!.textColor = UIColor(rgba: "#999999")
        infoTextView!.scrollEnabled = false
        infoTextView!.textContainer.lineFragmentPadding = 0
        infoTextView!.textContainerInset = UIEdgeInsetsZero
        contentView!.addSubview(infoTextView!)
        
        summaryTitleLabel = UILabel()
        summaryTitleLabel!.font = UIFont(name: "Toekomst-Book", size: 14.0)
        summaryTitleLabel!.text = "Samenwerking"
        summaryTitleLabel!.textColor = UIColor(rgba: "#009CFF")
        contentView!.addSubview(summaryTitleLabel!)
        
        summaryTextView = UITextView()
        summaryTextView!.backgroundColor = UIColor.clearColor()
        summaryTextView!.editable = false
        summaryTextView!.font = UIFont(name: "Toekomst-Book", size: 14.0)
        summaryTextView!.text = "Children have a distinct way of looking; they see different things from adults, and often perceive striking connections and inspiring analogies that grown-ups miss. "
        summaryTextView!.textColor = UIColor(rgba: "#999999")
        summaryTextView!.scrollEnabled = false
        summaryTextView!.textContainer.lineFragmentPadding = 0
        summaryTextView!.textContainerInset = UIEdgeInsetsZero
        contentView!.addSubview(summaryTextView!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        cornerView?.frame = CGRect(x: 0, y: 0, width: 74, height: 76)
        
        let contentWidth: CGFloat = 370.0
        let labelHeight: CGFloat = 20.0
        let labelMargin: CGFloat = 20.0
        
        infoTitleLabel?.frame = CGRect(x: 0, y: 0, width: contentWidth, height: labelHeight)
        
        let textViewAttributes = [
            NSFontAttributeName: UIFont(name: "Toekomst-Book", size: 14.0)!
        ]
        
        if let infoTextView = infoTextView {
            let infoText = infoTextView.text as NSString
            var infoTextViewFrame = infoText.boundingRectWithSize(CGSize(width: contentWidth, height: CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textViewAttributes, context: nil)
            
            infoTextViewFrame.origin.y = labelHeight + labelMargin
            infoTextView.frame = infoTextViewFrame
            
            if let summaryTitleLabel = summaryTitleLabel {
                summaryTitleLabel.frame = CGRect(x: 0, y: infoTextViewFrame.origin.y + infoTextViewFrame.height + 80, width: contentWidth, height: labelHeight)
                
                if let summaryTextView = summaryTextView {
                    let summaryText = summaryTextView.text as NSString
                    var summaryTextViewFrame = summaryText.boundingRectWithSize(CGSize(width: contentWidth, height: CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textViewAttributes, context: nil)
                    
                    summaryTextViewFrame.origin.y = summaryTitleLabel.frame.origin.y + labelHeight + labelMargin
                    summaryTextView.frame = summaryTextViewFrame
                }
            }
        }
        
        let contentHeight = summaryTextView != nil ? summaryTextView!.frame.origin.y + summaryTextView!.frame.height : 0
        contentView?.frame = CGRect(x: (view.frame.width / 2) - (contentWidth / 2), y: (view.frame.height / 2) - (contentHeight / 2), width: contentWidth, height: contentHeight)
    }
    
    internal func dismissViewController() {
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
