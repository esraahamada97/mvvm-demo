//
//  AppDelegate+Extension.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    func setWindow(_ application: UIApplication) {
        AppManager.launchApp(application)
        self.window = AppManager.shared.window
    }
    func initNetwork() {
        
        let defaults = NetworkDefaults(baseUrl: Environment.baseURL,
                                       apiKey: Environment.apiKey
        )
        
        NetworkManager.shared = NetworkManager(config: defaults)
        
        print(Environment.baseURL)
    }
}
