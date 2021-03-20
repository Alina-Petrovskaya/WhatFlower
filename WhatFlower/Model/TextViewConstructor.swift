//
//  TextViewConstructor.swift
//  WhatFlower
//
//  Created by Alina Petrovskaya on 16.03.2021.
//

import UIKit

class TextViewConstructor {
    private let flowerName: String
    private let description: String
    
    init(for flowerName: String, with description: String) {
        self.flowerName = flowerName
        self.description = description
    }
    
    func getDescription() -> NSMutableAttributedString? {
        let attributedContent = NSMutableAttributedString()
        
        guard let nameFont        = UIFont(name: "Optima Bold", size: 24.0),
              let descriptionFont = UIFont(name: "Optima Regular", size: 20.0)
        else { return nil }
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        let nameAttributes: [NSAttributedString.Key : Any]  = [.font: nameFont,
                                                               .paragraphStyle: paragraph]
        
        let descriptionAttributes = [NSAttributedString.Key.font: descriptionFont]
        
        let attributedNameText        = NSAttributedString(string: "\(flowerName)", attributes: nameAttributes)
        let attributeddescriptionText = NSAttributedString(string: "\(description)", attributes: descriptionAttributes)
        
        let description = attributedNameText
        
        attributedContent.append(attributedNameText)
        attributedContent.append(attributeddescriptionText)
        
        
        return attributedContent
    }
}
