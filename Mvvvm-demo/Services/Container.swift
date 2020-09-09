//
//  Container.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

class Container {
  
    class func getHomeViewController() -> UIViewController {
        let viewController = HomeModule.createModule()
        return viewController
    }

    class func embedVCInNavController(_ viewController: UIViewController) -> UIViewController {
        let nav = AppNavigationController(rootViewController: viewController)
        return nav
    }
}
