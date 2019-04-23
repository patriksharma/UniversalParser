//
//  ImagesLoader.swift
//  ExampleParser
//
//  Created by prateek sharma on 23/04/19.
//  Copyright © 2019 PrateekSharma. All rights reserved.
//

import Foundation
import UIKit
import UniversalParser

//Class for loading Images from API
class ImagesLoader{
    //method to load user profile pictures
    func loadProfileImage(imageView: UIImageView, urlString:String){
        let loader = Loader()
        loader.cacheData(urlString: urlString, onComplete: { (data) in
            imageView.image = UIImage(data: data as! Data)
            imageView.layer.cornerRadius = imageView.frame.width/2.2
            imageView.layer.masksToBounds = true
            imageView.alpha = 0.0
            UIView.animate(withDuration: 1.5, animations: { //animation for image loading with transistion effect
                imageView.alpha = 1.0
            })
        })
    }
    //method for loading card images or pinterest images
    func loadMainImage(loader: Loader, imageView: UIImageView, urlString:String, cancelButton:UIButton){
        loader.cacheData(urlString: urlString, onComplete: { (data) in
            imageView.image = UIImage(data: data as! Data)
            imageView.alpha = 0.0
            
            UIView.animate(withDuration: 2.0, animations: {//animation
                imageView.alpha = 1.0
            })
            imageView.image = UIImage(data: data as! Data)
            cancelButton.isHidden = true // hide cancel button once images loading in cell
        })
    }
    
}
