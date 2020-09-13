//
//  HomeWireframe.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/9/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

class HomeModule {

    class func createModule(viewModel: HomeViewModel) -> UIViewController {
        
        let view = HomeViewController(viewModel: viewModel)
        return view

    }
}
