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
    var redeem = 100
    var refund  = 20
    let progressView = UIView(frame: CGRect(x: 20, y: 500, width: 1, height: 50))
    var progressView2 : UIView =  UIView()
    var currentProgress: CGFloat = 0
    var currentProgress2: CGFloat = 50
    let progressLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
    let progressLabel2 = UILabel(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.backgroundColor = .blue
        self.view.addSubview(progressView)
        setProgress(CGFloat(redeem))
       
        progressView2.backgroundColor = .red
        self.view.addSubview(progressView2 )
        //setProgress2(10)
        
        progressLabel.text = "ee"
        progressLabel.text = String(currentProgress.description)
        
        self.view.addSubview(progressLabel)
        self.view.addSubview(progressLabel2)
        progressView2.isHidden = true
        //setLabelProgress(initialValue: self.currentProgress, targetValue: 100)
        progressLabel.text = String(70)
        //setLabelProgress2(initialValue: 100, targetValue: 150)
        // Do any additional setup after loading the view.
//        drawShapeAndAnimate()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//            self.splashTimeOut()
//        }
    }
    
    func setProgress(_ progress: CGFloat) {
        let fullWidth: CGFloat = 200
        let newWidth = progress / 100*fullWidth
        self.progressView2 = UIView(frame: CGRect(x: newWidth, y: 0, width: 1, height: 50))
        UIView.animate(withDuration: 1.5) {
            self.progressView.frame.size = CGSize(width: newWidth, height: self.progressView.frame.height)
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.progressView2.isHidden = false
            self.setProgress2(CGFloat(self.refund))
                }
        
    }
    func setProgress2(_ progress: CGFloat) {
        let fullWidth: CGFloat = 200
        let newWidth = progress / 100*fullWidth
        UIView.animate(withDuration: 1.5) {
            self.progressView2.frame.size = CGSize(width: newWidth, height: self.progressView2.frame.height)
        }
    }
    func setLabelProgress(initialValue: CGFloat, targetValue: CGFloat) {

        guard currentProgress != targetValue else { return }

        let range = targetValue - initialValue
        let increment = range / CGFloat(abs(range))
        let duration: TimeInterval = 1.5
        let delay = duration / TimeInterval(range)
        currentProgress += increment
        progressLabel.text = String(describing: currentProgress)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            self.setLabelProgress(initialValue: initialValue, targetValue: targetValue)
        }
    }
    
    func setLabelProgress2(initialValue: CGFloat, targetValue: CGFloat) {

        guard currentProgress != targetValue else { return }

        let range = targetValue - initialValue
        let increment = range / CGFloat(abs(range))
        let duration: TimeInterval = 1.5
        let delay = duration / TimeInterval(range)
        currentProgress += increment
        progressLabel2.text = String(describing: currentProgress)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            self.setLabelProgress(initialValue: initialValue, targetValue: targetValue)
        }
    }
    
//    func splashTimeOut() {
//        let homeView = Container.getHomeViewController()
//        AppManager.shared.window?.rootViewController = homeView
//        AppManager.shared.window?.makeKeyAndVisible()
//
//    }
//    private func drawShapeAndAnimate() {
//        self.shapeLayer?.removeFromSuperlayer()
//
//        // create whatever path you want
//
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 100, y: 500))
//        path.addLine(to: CGPoint(x: 300, y: 500))
//        path.addLine(to: CGPoint(x: 300, y: 300))
//        path.addLine(to: CGPoint(x: 100, y: 300))
//        path.addLine(to: CGPoint(x: 100, y: 500))
//
//        // create shape layer for that path
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0).cgColor
//        shapeLayer.strokeColor = UIColor.logoTextColor.cgColor
//        shapeLayer.lineWidth = 8
//        shapeLayer.path = path.cgPath
//
//        // animate it
//
//        view.layer.addSublayer(shapeLayer)
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//        animation.fromValue = 0
//        animation.duration = 2
//        shapeLayer.add(animation, forKey: "MyAnimation")
//
//        // save shape layer
//
//        self.shapeLayer = shapeLayer
//    }
//
    
}
