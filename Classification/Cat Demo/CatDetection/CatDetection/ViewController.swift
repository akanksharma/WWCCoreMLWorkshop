//
//  ViewController.swift
//  CatDetection
//
//  Created by Akanksha Sharma on 05/10/19.
//  Copyright © 2019 akanksharma. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {

    @IBOutlet weak var detectedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //predictUsingCoreML()
        predictUsingVision()
        // Do any additional setup after loading the view.
    }

    func predictUsingCoreML(){
        let catImage = UIImage.init(named : "cat.jpg")
        let model = MobileNet()

        
        if let pixelBuffer = catImage!.pixelBuffer(width: 224, height:224){
            let prediction = try? model.prediction(data:pixelBuffer)
            print(prediction?.classLabel)
        }
    }
    
    func predictUsingVision(){
        guard let catImage = UIImage.init(named : "cat.jpg") else {
            return
        }
        
        if let visionModel = try? VNCoreMLModel.init(for: MobileNet().model) {
            let predictionRequest = VNCoreMLRequest.init(model: visionModel) { (request, error) in
                print(request.results?.first)
            }
            
            let handler = VNImageRequestHandler.init(cgImage: catImage.cgImage!, options: [:])
            try? handler.perform([predictionRequest])
        }
        
    }
    

}

