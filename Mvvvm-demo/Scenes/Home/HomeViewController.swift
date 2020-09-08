//
//  HomeViewController.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fetchMovies()
    }
    
    func fetchMovies() {
        NetworkManager.shared
        .getPopularMovies(page: 1) { ( result: Result<NetworkResponse<MovieModel>, NetworkError>, _) in
            switch result {
            case .success(let listData):
                print("data \(listData)")
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
}
