//
//  HomeViewModel.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/9/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol: class {
    
    func fetchMovies()
}

class HomeViewModel: HomeViewModelProtocol {
    
    var movies: Binding<[MovieModel]>?
    var moviesError: Binding<NetworkError>?
    var movieDetails: Binding<MovieDetails>?
    var movieDetailsError: Binding<NetworkError>?
    
    func fetchMovies() {
        NetworkManager.shared
            .getPopularMovies(page: 1) { ( result: Result<MovieListsResponse<[MovieModel]>, NetworkError>, _) in
                switch result {
                case .success(let listData):
                    //self.movies = Binding(listData.results ?? [])
                    self.movies?.value = listData.results
                case .failure(let error):
                    print("error \(error)")
                    self.moviesError?.value = error
                }
        }
    }
    
    func fetchMovieDetails(movieId: Int) {
        NetworkManager.shared
            .getMovieDetails(movieId: movieId) { ( result: Result<MovieDetails, NetworkError>, _) in
                switch result {
                case .success(let listData):
                    //self.movies = Binding(listData.results ?? [])
                    self.movieDetails?.value = listData
                case .failure(let error):
                    print("error \(error)")
                    self.movieDetailsError?.value = error
                }
        }
    }
    
    init() {
        movies = Binding([])
        movieDetails = Binding(nil)
        moviesError = Binding(nil)
        movieDetailsError = Binding(nil)
    }
    
}
