//
//  UIColor+Extension.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

extension UIColor {
   class var primaryColor: UIColor {
        guard let color = UIColor(named: "PrimaryColor") else {
            return UIColor()
        }
        return color
    }
    
    class var logoTextColor: UIColor {
        guard let color = UIColor(named: "LogoTextColor") else {
            return UIColor()
        }
        return color
    }
}
