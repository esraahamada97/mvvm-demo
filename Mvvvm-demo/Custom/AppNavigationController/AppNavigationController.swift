//
//  AppNavigationController.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension UINavigationItem {
    
    func clearBackBarButtonTitle() {
        // Provide an empty backBarButton to hide the 'Back' text present by
        // default in the back button.
        let backBarButton: UIBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.backBarButtonItem = backBarButton
    }
}
