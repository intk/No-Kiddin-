//
//  InfoViewModel.swift
//  No Kiddin'
//
//  Created by Sjors Snoeren on 07-09-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import Foundation

enum InfoTableViewCellModelType {
    case Title, Content, Image
}

class InfoTableViewCellModel {
    
    internal var type: InfoTableViewCellModelType?
    
}

class InfoTableViewTextCellModel: InfoTableViewCellModel {
    
    internal var text: String?
    
}

class InfoTableViewImageCellModel: InfoTableViewCellModel {
    
    internal var image: UIImage?
    
}

class InfoViewModel {
    
    private var viewController: InfoViewController
    
    init(viewController: InfoViewController) {
        self.viewController = viewController
        
        self.viewController.cellModels = cellModels()
    }
    
    private func cellModels() -> [InfoTableViewCellModel] {
        var array = Array<InfoTableViewCellModel>()
        
        let aboutTitle = InfoTableViewTextCellModel()
        aboutTitle.type = .Title
        aboutTitle.text = "Informatie over de app"
        array.append(aboutTitle)
        
        let aboutContent = InfoTableViewTextCellModel()
        aboutContent.type = .Content
        aboutContent.text = readTextFile("about-content")
        array.append(aboutContent)
        
        let radboudTitle = InfoTableViewTextCellModel()
        radboudTitle.type = .Title
        radboudTitle.text = "Collectie Radboudumc"
        array.append(radboudTitle)
        
        let radboudContent = InfoTableViewTextCellModel()
        radboudContent.type = .Content
        radboudContent.text = readTextFile("radboudumc-content")
        array.append(radboudContent)
        
        let vanAbbeMuseumTitle = InfoTableViewTextCellModel()
        vanAbbeMuseumTitle.type = .Title
        vanAbbeMuseumTitle.text = "Collectie Van Abbemuseum "
        array.append(vanAbbeMuseumTitle)
        
        let vanAbbeMuseumContent = InfoTableViewTextCellModel()
        vanAbbeMuseumContent.type = .Content
        vanAbbeMuseumContent.text = readTextFile("vanabbe-content")
        array.append(vanAbbeMuseumContent)
        
        let creditsTitle = InfoTableViewTextCellModel()
        creditsTitle.type = .Title
        creditsTitle.text = "Colofon"
        array.append(creditsTitle)
        
        let creditsContent = InfoTableViewTextCellModel()
        creditsContent.type = .Content
        creditsContent.text = readTextFile("credits-content")
        array.append(creditsContent)
        
        let vanAbbeMuseumLogo = InfoTableViewImageCellModel()
        vanAbbeMuseumLogo.type = .Image
        vanAbbeMuseumLogo.image = UIImage(named: "VanAbbeMuseum")
        array.append(vanAbbeMuseumLogo)
        
        let radboudLogo = InfoTableViewImageCellModel()
        radboudLogo.type = .Image
        radboudLogo.image = UIImage(named: "RadboudUMC")
        array.append(radboudLogo)
        
        return array
    }
    
    private func readTextFile(name: String) -> String? {
        let error: NSError? = nil
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "txt")!
        
        return NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil) as? String
    }
    
}