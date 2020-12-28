//
//  UIImageView+Cache.swift
//  Classifieds
//
//  Created by Apple on 28/12/20.
//  Copyright © 2020 Jainesh Patel. All rights reserved.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()
private let defaultImage = UIImage(named: "placeholder")

extension UIImageView {
    func loadImage(urlString: String) {
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cacheImage
            return
        }
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                self.image = defaultImage
            }
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Couldn't download image: ", error)
                DispatchQueue.main.async {
                    self.image = defaultImage
                }
                return
            }
            
            guard let data = data,
                let image = UIImage(data: data) else {
                    DispatchQueue.main.async {
                        self.image = defaultImage
                    }
                    return
            }
            imageCache.setObject(image, forKey: urlString as AnyObject)
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
        
    }
}
