//
//  HomeViewController.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: - Private Variables
    private var homeViewModel: HomeViewModel?
    private var moviesList: [MovieModel]?
    private var movieDetails: MovieDetails?
    
    // MARK: - Public Variables
    // MARK: - IBOutletes
    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fireMoviesListeners()
        fireMoviesDetailsListeners()
    }
    
    init(viewModel: HomeViewModel) {
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private
extension HomeViewController {
    private func requestData() {
        showLoader(view: self.view, type: .native)
        homeViewModel?.fetchMovies()
        homeViewModel?.fetchMovieDetails(movieId: 505)
    }
    
    private func fireMoviesListeners() {
        fetchMoviesSucces()
        fetchMoviesFail()
    }
    
    private func fetchMoviesSucces() {
        homeViewModel?.movies?.bind { [weak self] movies in
            self?.hideLoader()
            self?.moviesList = movies
        }
    }
    
    private func fetchMoviesFail() {
        homeViewModel?.moviesError?.bind { [weak self] error in
            self?.showError(message: error.message ?? "")
        }
    }
    
    private func fireMoviesDetailsListeners() {
        fetchMoviesDetailsSucces()
        fetchMoviesDetailsFail()
    }
    
    private func fetchMoviesDetailsSucces() {
        homeViewModel?.movieDetails?.bind { [weak self] details in
            self?.hideLoader()
            self?.movieDetails = details
        }
    }
    
    private func fetchMoviesDetailsFail() {
        homeViewModel?.movieDetailsError?.bind { [weak self] error in
            self?.showError(message: error.message ?? "")
        }
    }
}

// MARK: - Public
extension HomeViewController {}

// MARK: - IBAction
extension HomeViewController{}

// MARK: - Delegates
extension HomeViewController{}
