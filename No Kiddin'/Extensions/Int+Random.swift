//
//  Int+Random.swift
//  Nokiddin
//
//  Created by Sjors Snoeren on 02-06-15.
//  Copyright (c) 2015 Sjors Snoeren. All rights reserved.
//

import Foundation

extension Int {
    
    static func rand(max: Int) -> Int {
        return Int(arc4random() % UInt32(max))
    }
    
    static func rand(max: Int, notIn array: Array<Int>) -> Int {
        var rand = self.rand(max)
        while (array.contains(rand)) {
            rand = self.rand(max)
        }
        
        return rand
    }
    
}