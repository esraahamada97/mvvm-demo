//
//  HomeWebService.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/15/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeWebServiceProtocol: class {
    
    func getPopularMovies(page: Int) -> Observable<MovieListsResponse<[MovieModel]>>
    
//    func postMovieRate(rate: Int,
//                       completion: @escaping(
//    _ result: Swift.Result<NetworkResponse, NetworkError>,
//    _ statusCode: Int?) -> Void)
}

class HomeWebService: HomeWebServiceProtocol {
//    func postMovieRate(rate: Int, completion: @escaping (Result<NetworkResponse, NetworkError>, Int?) -> Void) {
//         NetworkManager.shared.fetch(endPoint: PopularMoviesService
//            .postMovieReview(value: rate)) { (result: Result<NetworkResponse, NetworkError>, statusCode) in
//                   switch result {
//                   case .success(let data):
//                       //self.movies = Binding(listData.results ?? [])
//                       // must send statuscode as property in model
//                       //check the status code
//                    completion(Result.success(data), nil)
//                   case .failure(let error):
//                    print("error \(error.errorMessage())")
//
//                       completion(Result.failure(error), statusCode)
//                   }
//         }
    
    static let shared = HomeWebService()
    
    func getPopularMovies(page: Int) -> Observable<MovieListsResponse<[MovieModel]>> {
        return
            NetworkManager.shared.fetch(endPoint: PopularMoviesService.getPopularMovies(page: page))
    }
        
}
//func getPopularMovies(page: Int) -> Observable<MovieListsResponse<MovieModel>>  {
//    let disposeBag = DisposeBag()
//   return NetworkManager.shared.fetch(endPoint: PopularMoviesService.getPopularMovies(page: page))
//        .subscribe { [weak self] (event) in
//        guard self != nil else { return }
//        switch event {
//        case .next(let result):
//            print(result)
//            do {
//                let jsonData = try JSONDecoder().decode(MovieListsResponse<[MovieModel]>.self, from: result.data)
//
//            } catch {
//                print(error.localizedDescription)
//            }
//        case .error(let err):
//            print(err)
//        case .completed:
//            print("complete")
//        }
//        }.disposed(by: disposeBag)
//
//}
