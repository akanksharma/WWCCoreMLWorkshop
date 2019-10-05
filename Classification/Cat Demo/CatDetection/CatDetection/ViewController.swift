//
//  ViewController.swift
//  CatDetection
//
//  Created by Akanksha Sharma on 05/10/19.
//  Copyright © 2019 akanksharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var detectedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        predictUsingCoreML()
        // Do any additional setup after loading the view.
    }

    func predictUsingCoreML(){
        let model = MobileNet()
        if let imageBuffer = detectedImage.image?.pixelBuffer(width: 224, height: 224) {
           let prediction = try? model.prediction(data: imageBuffer)
            print(prediction?.classLabel)
        }
    }
    
    

}

