//
//  HomeViewController.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeViewModel: HomeViewModel?
    private var moviesList: [MovieModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        homeViewModel?.movies?.bind { [weak self] movies in
            self?.moviesList = movies
           // print("essssss", self?.moviesList)
        }
        homeViewModel?.fetchMovies()
    }
    
    init(viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
