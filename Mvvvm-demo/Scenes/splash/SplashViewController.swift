//
//  SplashViewController.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/14/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    weak var shapeLayer: CAShapeLayer?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        drawShapeAndAnimate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.splashTimeOut()
        }
    }
    
    func splashTimeOut() {
        let homeView = Container.getHomeViewController()
        AppManager.shared.window?.rootViewController = homeView
        AppManager.shared.window?.makeKeyAndVisible()

    }
    private func drawShapeAndAnimate() {
        self.shapeLayer?.removeFromSuperlayer()

        // create whatever path you want
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 100, y: 500))
        path.addLine(to: CGPoint(x: 300, y: 500))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 100, y: 500))

        // create shape layer for that path

        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        shapeLayer.strokeColor = UIColor.logoTextColor.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.path = path.cgPath

        // animate it

        view.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = 2
        shapeLayer.add(animation, forKey: "MyAnimation")

        // save shape layer

        self.shapeLayer = shapeLayer
    }
}
