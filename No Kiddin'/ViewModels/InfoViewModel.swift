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
        
        let logo = InfoTableViewImageCellModel()
        logo.type = .Image
        logo.image = UIImage(named: "Logos")
        array.append(logo)
        
        return array
    }
    
    private func readTextFile(name: String) -> String? {
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "txt")!
        
        do {
            let text: String = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String
            return text
        } catch _ {
            fatalError("Cannot read file")
        }
    }
    
}