//
//  Decoder.swift
//  WhatFlower
//
//  Created by Alina Petrovskaya on 11.03.2021.
//

import UIKit
import SwiftyJSON

typealias DescriptionOfFlower = (description: String, imageURL: URL?, flowerName: String, pageURL: URL?)

protocol Decoder {
    init(flowerJSON: JSON)
    func getDescriptionOfFlower() -> DescriptionOfFlower
}

class DefaultDecoder: Decoder {
    var flowerJSON: JSON
    
    required init(flowerJSON: JSON) {
        self.flowerJSON = flowerJSON
    }
    
    func getDescriptionOfFlower() -> DescriptionOfFlower {
        let pageid            = flowerJSON["query"]["pageids"][0].stringValue
        let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue
        let imageURL          = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
        let flowerName        = flowerJSON["query"]["normalized"][0]["to"].stringValue
        let pageLink           = "https://en.wikipedia.org/?curid=" + pageid
        
        let cleanFlowerDescription = flowerDescription.replacingOccurrences(of: "<[^>]+>",
                                                                            with: "",
                                                                            options: .regularExpression,
                                                                            range: nil)
        let url = URL(string: imageURL)
        let pageURL = URL(string: pageLink)
        
        return (description: cleanFlowerDescription, imageURL: url, flowerName: flowerName, pageURL: pageURL)
    }
}
