//
//  CoreModelDataHandler.swift
//  WhatFlower
//
//  Created by Alina Petrovskaya on 15.03.2021.
//

import UIKit
import CoreML
import Vision

protocol CoreModelDataHandler {
    func detect(image: CIImage, completion: @escaping (String) -> ())
}

class FlowerDataHandler: CoreModelDataHandler {
    
    func detect(image: CIImage, completion: @escaping (String) -> ()) {
        guard let model = try? VNCoreMLModel(for: FloverClassifier(configuration: .init()).model)
        else { fatalError("Can't get model from Inceptionv3") }
        
        let request = VNCoreMLRequest(model: model) { request, error  in
            guard let results = request.results as? [VNClassificationObservation]
            else { fatalError("Modal failed to process image") }
            
            if let firstResult = results.first?.identifier {
                
                completion(firstResult.description)
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
            
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
