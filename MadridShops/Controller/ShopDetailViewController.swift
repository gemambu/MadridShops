//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by Gema on 15/9/17.
//  Copyright © 2017 Gema. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var shop: Shop?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.shop?.name
        self.descriptionView.text = self.shop?.description
        self.shop?.image.loadImage(into: imageView)
        
    }
    
    


}
