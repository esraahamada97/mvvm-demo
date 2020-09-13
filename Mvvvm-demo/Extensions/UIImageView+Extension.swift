//
//  UIImageView+Extension.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    func loadImageFromUrl(urlString: String,
                          placeHolderImage: UIImage?,
                          animation: ImageTransition = .crossDissolve(0.2)) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        self.af.setImage(withURL: url,
                         placeholderImage: placeHolderImage,
                         filter: nil,
                         imageTransition: animation)
    }
}
