//
//  DataTypeListener.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/30/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
final class DataTypeListener<T> {
    var movies: Binding<T> = Binding(nil)
    
    var dataTypeValue: T? {
        didSet {
            if let value = dataTypeValue {
                movies.value = value
            }
        }
    }
    
    //3
      init(_ value: T?) {
        self.dataTypeValue = value
      }
}
