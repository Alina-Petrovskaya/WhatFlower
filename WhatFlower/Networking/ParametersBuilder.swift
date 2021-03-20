//
//  ParametersBuilder.swift
//  WhatFlower
//
//  Created by Alina Petrovskaya on 11.03.2021.
//

import Foundation

protocol ParametersBuilder: class {
    init(flowerName: String)
    func buildParameters() -> [String: String]?
}

class FlowerInfoParametersBuilder: ParametersBuilder {
    private struct Constants {
        static let format       = "json"
        static let action       = "query"
        static let prop         = "extracts|pageimages"
        static let exintro      = ""
        static let explainText  = ""
        static var titles       = ""
        static let indexpageids = ""
        static let redirects    = "1"
        static let pithumbsize  = "500" //size for image
    }
    
    required init(flowerName: String) {
        Constants.titles = flowerName
    }
    
    func buildParameters() -> [String : String]? {
        let parameters = [
            "format": Constants.format,
            "action": Constants.action,
            "prop": Constants.prop,
            "exintro": Constants.exintro,
            "explainText": Constants.explainText,
            "titles": Constants.titles,
            "indexpageids": Constants.indexpageids,
            "redirects": Constants.redirects,
            "pithumbsize": Constants.pithumbsize
        ]
        return parameters
    }
}
