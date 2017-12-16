//
//  Card.swift
//  Concentration
//
//  Created by Luis Godinez on 11/21/17.
//  Copyright © 2017 Luis Godinez. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    init(identifier: Int){
        self.identifier = identifier
    }
    
    private static func getUniqueIdentifier() -> Int {
        //Card.identifierFactory += 1
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
