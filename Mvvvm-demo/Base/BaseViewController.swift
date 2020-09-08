//
//  BaseViewController.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension BaseViewController: LoaderProtocol {
    
    func showLoader(view: UIView, type: LoaderType) {
        Loader.show(onView: view, type: type)
    }
    
    func hideLoader() {
        Loader.hide()
    }
}

extension BaseViewController {
    func showError(message: String) {}
}
