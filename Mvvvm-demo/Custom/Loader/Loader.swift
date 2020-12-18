//
//  Loader.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import MBProgressHUD

class Loader: NSObject {
    
    static var sharedViewSpinner: UIView?
    private static var onView = UIView()
    
    class func show (onView: UIView, type: LoaderType) {
        
        self.onView = onView
        if sharedViewSpinner != nil {
            sharedViewSpinner?.removeFromSuperview()
        }
        
        let spinnerView = UIView(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = UIColor.gray
            //.primaryColor2
            //.loaderBackgroundColor
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        switch type {
        case .custom:
            
            let hud = MBProgressHUD.showAdded(to: onView, animated: true)
            hud.backgroundView.style = MBProgressHUDBackgroundStyle.solidColor
            hud.backgroundView.color = UIColor.black.withAlphaComponent(0.3)
            hud.bezelView.backgroundColor = UIColor.green
            hud.contentColor = UIColor.black
            hud.mode = MBProgressHUDMode.indeterminate
            
        case .native:
            let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            activityIndicator.color = UIColor.logoTextColor
            activityIndicator.startAnimating()
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)
            
            viewBackgroundLoading.center = spinnerView.center
            viewBackgroundLoading.backgroundColor = UIColor.primaryColor
            viewBackgroundLoading.alpha = 1
            viewBackgroundLoading.clipsToBounds = true
            viewBackgroundLoading.layer.cornerRadius = 15
            
            spinnerView.addSubview(viewBackgroundLoading)
            onView.addSubview(spinnerView)
            
            sharedViewSpinner = spinnerView
        }
    }
    
    class func hide() {
        
        // native
        sharedViewSpinner?.removeFromSuperview()
        sharedViewSpinner = nil
        // custom
        MBProgressHUD.hide(for: onView, animated: true)
    }
}
