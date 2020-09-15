//
//  HomeViewModel.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/9/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class HomeViewModel {
    
     weak var service: HomeWebServiceProtocol?
    var movies: Binding<MovieListsResponse<[MovieModel]>>?
    var moviesError: Binding<NetworkError>?
    var movieDetails: Binding<MovieDetails>?
    var movieDetailsError: Binding<NetworkError>?
    
    func fetchMovies(page: Int) {
        service?.getPopularMovies(page: page) { ( result: Result<MovieListsResponse<[MovieModel]>, NetworkError>, _) in
            switch result {
            case .success(let listData):
                //self.movies = Binding(listData.results ?? [])
                self.movies?.value = listData
            case .failure(let error):
                print("error \(error)")
                self.moviesError?.value = error
            }
        }

    }
    
    func fetchMovieDetails(movieId: Int) {
        // refactor code when make movies details module
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
    
    init(service: HomeWebServiceProtocol = HomeWebService.shared) {
        self.service = service
        movies = Binding(nil)
        movieDetails = Binding(nil)
        moviesError = Binding(nil)
        movieDetailsError = Binding(nil)
    }
    
}
