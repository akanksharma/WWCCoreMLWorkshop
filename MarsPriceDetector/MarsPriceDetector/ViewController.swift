//
//  ViewController.swift
//  MarsPriceDetector
//
//  Created by Akanksha Sharma on 05/10/19.
//  Copyright © 2019 akanksharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pricePredictorModel = MarsHabitatPricer()
        let price = try? pricePredictorModel.prediction(solarPanels: 12.0, greenhouses: 24.0, size: 600.0)
        print(price?.price)
        
        // Do any additional setup after loading the view.
    }


}

