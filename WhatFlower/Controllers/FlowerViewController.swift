//
//  FlowerViewController.swift
//  WhatFlower
//
//  Created by Alina Petrovskaya on 09.03.2021.
//

import UIKit
import SDWebImage

class FlowerViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var flowerDescription: UITextView!
    @IBOutlet weak var browserButton: UIButton!
    let photoPicker = UIImagePickerController()
    var pageURL: URL? = nil
    
    @IBAction func makePhoto(_ sender: UIBarButtonItem) {
        preparePicker()
        present(photoPicker, animated: true)
    }
    
    @IBAction func showInBrowserTupped(_ sender: UIButton) {
        
        if let safeUrl = pageURL {
                    UIApplication.shared.open(safeUrl)
                }
    }
    
    private func detectFlower(image: CIImage){
        let modelHandler: CoreModelDataHandler = FlowerDataHandler()
        modelHandler.detect(image: image) { [weak self] (title) in
            self?.getRequestInfo(flowerName: title)
        }
    }
    
    private func getRequestInfo(flowerName: String) {
        let networkingService = NewsNetworkingService(flowerName: flowerName)
        networkingService.requestData { [weak self] (result) in
            
            switch result{
            case .success(let flowerInfo):
                self?.imageView.sd_setImage(with: flowerInfo.imageURL)
                self?.pageURL = flowerInfo.pageURL
                self?.browserButton.isHidden = false
                
                self?.prepareDescription(flowerName: flowerInfo.flowerName,
                                         description: flowerInfo.description)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func prepareDescription(flowerName: String, description: String) {
        let textViewConstructor = TextViewConstructor(for: flowerName, with: description)
        
        flowerDescription.attributedText = textViewConstructor.getDescription()
    }
}


// MARK: UIImagePickerControllerDelegate
extension FlowerViewController: UIImagePickerControllerDelegate {
    
    private func preparePicker() {
        photoPicker.delegate      = self
        photoPicker.sourceType    = .camera
        photoPicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickerImage = info[.originalImage] as? UIImage {
            imageView.image = userPickerImage
            
            guard let ciImage = CIImage(image: userPickerImage)
            else { fatalError("Couldn't covert to CIImage") }
            
            detectFlower(image: ciImage)
        }
        photoPicker.dismiss(animated: true)
    }
}

