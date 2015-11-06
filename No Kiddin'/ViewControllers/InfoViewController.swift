//
//  InfoViewController.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 02-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

class AttributedTableViewCell: UITableViewCell {
    
    private var textView: UITextView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clearColor()
        selectionStyle = .None
            
        textView = UITextView()
        textView!.editable = false
        textView!.selectable = true
        textView!.scrollEnabled = false
        textView!.dataDetectorTypes = .Link
        textView!.linkTextAttributes = [NSForegroundColorAttributeName: UIColor(rgba: "#222222")]
        textView!.textContainerInset = UIEdgeInsetsZero
        textView!.textContainer.lineFragmentPadding = 0
        textView!.backgroundColor = UIColor.clearColor()
        addSubview(textView!)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textView?.frame = CGRect(x: 144, y: 0, width: frame.width - 288, height: frame.height - 30.0)
    }
    
    internal func setAttributedText(text: String?, attributes: [String: AnyObject]) {
        if let text = text {
            textView?.attributedText = NSAttributedString(string: text, attributes: attributes)
        }
    }
    
}

class ImageTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.clearColor()
        selectionStyle = .None
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView?.frame = CGRect(x: 144, y: 0, width: 480, height: frame.height - 30.0)
    }
    
}

class InfoViewController: UIViewController, UIViewControllerTransitioningDelegate, UITableViewDataSource, UITableViewDelegate {

    private var cornerView: CornerView?
    
    private lazy var titleAttributes: [String: AnyObject!] = {
        return [
            NSFontAttributeName: UIFont(name: "Toekomst-Book", size: 18.0)!,
            NSForegroundColorAttributeName: UIColor(rgba: "#009CFF"),
        ]
    }()
    
    private lazy var contentAttributes: [String: AnyObject!] = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        
        return [
            NSFontAttributeName: UIFont(name: "Toekomst-Book", size: 18.0),
            NSParagraphStyleAttributeName: paragraphStyle,
            NSForegroundColorAttributeName: UIColor(rgba: "#555555")
        ]
    }()
    
    internal var cellModels: [InfoTableViewCellModel] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private var viewModel: InfoViewModel?
    private var tableView: UITableView?
    
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
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.95)
        
        cornerView = CornerView()
        cornerView!.cornerViewItem = CornerViewItem(target: self, selector: Selector("dismissViewController"), image: UIImage(named: "Cross")!, tintColor: UIColor(rgba: "#FD2C2C"))
        view.addSubview(cornerView!)

        tableView = UITableView()
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.separatorStyle = .None
        tableView!.contentOffset = CGPoint(x: 0, y: -60.0)
        tableView!.contentInset = UIEdgeInsets(top: 60.0, left: 0, bottom: 40.0, right: 0)
        tableView!.backgroundColor = UIColor.clearColor()
        tableView!.registerClass(ImageTableViewCell.classForCoder(), forCellReuseIdentifier: "ImageCell")
        tableView!.registerClass(AttributedTableViewCell.classForCoder(), forCellReuseIdentifier: "TextCell")
        view.addSubview(tableView!)
        
        viewModel = InfoViewModel(viewController: self)
        
        view.bringSubviewToFront(cornerView!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        cornerView?.frame = CGRect(x: 0, y: 0, width: 74, height: 76)
        tableView?.frame = view.bounds
    }
    
    internal func dismissViewController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let model = cellModels[indexPath.row]
        
        switch model.type! {
        case .Title:
            let textModel = model as! InfoTableViewTextCellModel
            let frame = textModel.text!.boundingRectWithSize(
                CGSize(width: view.frame.width - 288, height: .max),
                options: .UsesLineFragmentOrigin,
                attributes: titleAttributes, context: nil)
            return frame.height + 30.0
        case .Content:
            let textModel = model as! InfoTableViewTextCellModel
            let frame = textModel.text!.boundingRectWithSize(
                CGSize(width: view.frame.width - 288, height: .max),
                options: .UsesLineFragmentOrigin,
                attributes: contentAttributes, context: nil)
            return frame.height + 30.0
        case .Image:
            let imageModel = model as! InfoTableViewImageCellModel
            return (imageModel.image!.size.height / (imageModel.image!.size.width / 480)) + 30.0
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: AnyObject
        let model = cellModels[indexPath.row]
        
        switch model.type! {
        case .Title:
            cell = tableView.dequeueReusableCellWithIdentifier("TextCell") as! AttributedTableViewCell
            let textModel = model as! InfoTableViewTextCellModel
            cell.setAttributedText(textModel.text, attributes: titleAttributes)
        case .Image:
            cell = tableView.dequeueReusableCellWithIdentifier("ImageCell") as! ImageTableViewCell
            let imageModel = model as! InfoTableViewImageCellModel
            cell.imageView??.image = imageModel.image
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("TextCell") as! AttributedTableViewCell
            let textModel = model as! InfoTableViewTextCellModel
            cell.setAttributedText(textModel.text, attributes: contentAttributes)
        }
        
        return cell as! UITableViewCell
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeViewControllerTransition(isPresenting: true)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeViewControllerTransition(isPresenting: false)
    }
    
}
