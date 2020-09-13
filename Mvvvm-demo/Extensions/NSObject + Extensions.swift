//
//  NSObject + Extensions.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

extension NSObject {
    
    // return Class Name
    public static var className: String {
        return String(describing: self)
    }
}
