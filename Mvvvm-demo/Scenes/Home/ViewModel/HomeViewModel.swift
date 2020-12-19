//
//  HomeViewModel.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/9/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
   
     weak var service: HomeWebServiceProtocol!
    struct Input {
            let page: Observable<Int>
        }

        struct Output {
            let dataDriver: Driver<MovieListsResponse<[MovieModel]>>
        }
    
    init(service: HomeWebServiceProtocol = HomeWebService.shared) {
        self.service = service
    }
   
    func fetchMovies(_ input: Input) -> Output {
        let dataDriver = service.getPopularMovies(page: 1)
            .map { data in
                
                    return data
                   }
            .asDriver(onErrorJustReturn: MovieListsResponse())

               //Forward button clicks to the interactor:
              
               // don't need to put in dispose bag because the button will emit a `completed` event when done.

               return Output(dataDriver: dataDriver)
           }
        

//        service?.getPopularMovies(page: page) { ( result: Result<MovieListsResponse<[MovieModel]>, NetworkError>, _) in
//            switch result {
//            case .success(let listData):
//                //self.movies = Binding(listData.results ?? [])
//                self.movies.value = listData
//            case .failure(let error):
//                print("error \(error)")
//                self.moviesError.value = error
//            }
//        }
    }
    
    func fetchMovieDetails(movieId: Int) {
        // refactor code when make movies details module
        NetworkManager.shared
            .getMovieDetails(movieId: movieId) { ( result: Result<MovieDetails, NetworkError>, _) in
                switch result {
                case .success(let listData):
                    print(listData)
                    //self.movies = Binding(listData.results ?? [])
                    //self.movieDetails.value = listData
                case .failure(let error):
                    print("error \(error)")
                   // self.movieDetailsError.value = error
                }
            }
    }
    
    func postMovieRate(rate: Int) {
        
//     service?.postMovieRate(rate: rate) { ( result: Result<NetworkResponse, NetworkError>, _) in
//         switch result {
//         case .success(let message):
//             //self.movies = Binding(listData.results ?? [])
//            self.postMovieRateMessage.value = message.statusMessage
//         case .failure(let error):
//            print("error \(String(describing: error.errorMessage()))")
//             //self.moviesError.value = error
//         }
//     }
        
    }
