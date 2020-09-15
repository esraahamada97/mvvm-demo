//
//  Binding.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/9/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

final class Binding<T> {
    //1
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    //2
    var value: T? {
        didSet {
            if let value = value {
                listener?(value)
            }
        }
    }
    
    //3
      init(_ value: T?) {
        self.value = value
      }
    
    //4
    func bind(listener: Listener?) {
        self.listener = listener
    }
}
