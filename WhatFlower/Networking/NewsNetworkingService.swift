//
//  NewsNetworkingService.swift
//  WhatFlower
//
//  Created by Alina Petrovskaya on 11.03.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsNetworkingService {
    
    private struct Constants {
        static let baseUrlString = "https://en.wikipedia.org/w/api.php"
    }
    
    private let flowerName: String
    private let parametersBuilder: ParametersBuilder
    
    
    init(flowerName: String, parametersBuilder: ParametersBuilder? = nil) {
        self.flowerName = flowerName
        
        guard let safeParametersBuilder = parametersBuilder
        else {
            self.parametersBuilder = FlowerInfoParametersBuilder(flowerName: flowerName)
            return
        }
        
        self.parametersBuilder = safeParametersBuilder
    }
    
    
    func requestData(completion: @escaping (Result<DescriptionOfFlower, Error>) -> ()) {
        AF.request(Constants.baseUrlString, method: .get,
                   parameters: parametersBuilder.buildParameters())
            .responseJSON { (responce) in
                switch responce.result {
                case .success(let data):
                    let decoder: Decoder = DefaultDecoder(flowerJSON: JSON(data))
                    let flowerInfo = decoder.getDescriptionOfFlower()
                    
                    completion(.success(flowerInfo))
                    
                case .failure(_):
                    completion(.failure(ServerError.unableToDecode))
                }
            }
    }
    
    func requestImage(imageURL: String) {
        
    }
}
