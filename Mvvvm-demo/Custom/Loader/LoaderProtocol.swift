//
//  LoaderProtocol.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import  UIKit

protocol LoaderProtocol {
    func showLoader(view: UIView, type: LoaderType)
    func hideLoader()
}

enum LoaderType {
    case custom, native
}
