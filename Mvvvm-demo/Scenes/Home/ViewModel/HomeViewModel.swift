//
//  HomeViewModel.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/9/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    weak var service: HomeWebServiceProtocol!
    
    init(service: HomeWebServiceProtocol = HomeWebService.shared) {
        self.service = service
    }
    
    func fetchMovies(page: Int) -> Observable<MovieListsResponse<[MovieModel]>> {
        return service.getPopularMovies(page: page)
    }
}
