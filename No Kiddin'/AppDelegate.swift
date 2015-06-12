//
//  AppDelegate.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 01-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {       
        application.statusBarHidden = true
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let navigationController = UINavigationController(rootViewController: KidsViewController())
        navigationController.setNavigationBarHidden(true, animated: false)
        
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }
    
}
