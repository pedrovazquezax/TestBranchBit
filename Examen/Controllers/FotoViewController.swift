//
//  FotoViewController.swift
//  Examen
//
//  Created by Pedro Antonio Vazquez Rodriguez on 24/09/20.
//  Copyright © 2020 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class FotoViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url:URL = URL(string: "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papaercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg" ){
            self.imageView.load(url: url)
        }
    }
    
}
