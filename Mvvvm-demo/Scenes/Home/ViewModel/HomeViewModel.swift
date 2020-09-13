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
  
//    let movieObject = MovieModel(movieID: 0, title: "", posterPath: "", originalTitle: "")
    
    var movies: Binding<[MovieModel]>?
    
        func fetchMovies() {
            NetworkManager.shared
            .getPopularMovies(page: 1) { ( result: Result<NetworkResponse<[MovieModel]>, NetworkError>, _) in
                switch result {
                case .success(let listData):
                    //self.movies = Binding(listData.results ?? [])
                    self.movies?.value = listData.results ?? []
                case .failure(let error):
                    print("error \(error)")
                }
            }
        }
    
    init() {
        movies = Binding([])
      //fetchMovies()
    }
    
}
