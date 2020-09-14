//
//  HomeViewController.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import SwiftPullToRefresh

class HomeViewController: BaseViewController {
    
    // MARK: - Private Variables
    private var homeViewModel: HomeViewModel?
    private var moviesList: [MovieModel]?
    private var movieDetails: MovieDetails?
    private var listResponseObject: MovieListsResponse<[MovieModel]>?
    private var isLoadMore = false
    
    // MARK: - Public Variables
    
    // MARK: - IBOutletes
    @IBOutlet private weak var moviesCollectionView: UICollectionView!
    
    // MARK: - Computed Variables
       lazy var refreshControl: UIRefreshControl = {
           let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .logoTextColor
           refreshControl.addTarget(self,
                                    action: #selector(handlePullToRefresh(_:)),
                                    for: UIControl.Event.valueChanged)
           return refreshControl
       }()
    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setCollectionView()
        fireMoviesListeners()
        fireMoviesDetailsListeners()
        requestData()
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
        homeViewModel?.fetchMovies(page: 1)
        homeViewModel?.fetchMovieDetails(movieId: 505)
    }
    
    private func fireMoviesListeners() {
        fetchMoviesSucces()
        fetchMoviesFail()
    }
    
    private func fetchMoviesSucces() {
        
        homeViewModel?.movies?.bind { [weak self] movies in
            //self?.hideLoader()
            if self?.isLoadMore ?? true {
                self?.isLoadMore = false
                self?.moviesList?.append(contentsOf: movies.results ?? [])
               self?.listResponseObject = movies
                self?.moviesCollectionView.reloadData()
                self?.moviesCollectionView.spr_endRefreshing()
                
            } else {
            self?.moviesCollectionView.spr_endRefreshing()
            self?.refreshControl.endRefreshing()
            UIView.animate(withDuration: 0.2, animations: {
                self?.moviesList = []
                self?.moviesCollectionView.reloadData()
            }, completion: { _ in
                self?.moviesList = movies.results ?? []
                self?.listResponseObject = movies
                self?.moviesCollectionView.reloadData()
            })
        }
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
    
    private func setCollectionView() {
           
           moviesCollectionView.dataSource = self
           moviesCollectionView.delegate = self
           
           moviesCollectionView.register(
            UINib(nibName: MovieCell.className,
                  bundle: nil),
            forCellWithReuseIdentifier: MovieCell.className)
        
        moviesCollectionView.refreshControl = refreshControl
        
        moviesCollectionView.spr_setIndicatorFooter {
                   print("load more")
                   self.loadMore()
        }
           }
    
    @objc
       private func handlePullToRefresh(_ refreshControl: UIRefreshControl) {
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.homeViewModel?.fetchMovies(page: 1)
           }
       }
    
    private func loadMore() {

        let currentPage = listResponseObject?.page ?? 0
        if currentPage < listResponseObject?.totalPages ?? 0 {
            isLoadMore = true
            homeViewModel?.fetchMovies(page: currentPage + 1)
        } else {
            moviesCollectionView.spr_endRefreshing()
        }
    }
}

// MARK: - Public
extension HomeViewController {}

// MARK: - IBAction
extension HomeViewController {
    
}

// MARK: - Delegates
extension HomeViewController: UICollectionViewDataSource {
      func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return moviesList?.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: MovieCell.className,
                    for: indexPath) as? MovieCell else {
                        return UICollectionViewCell() }
            guard let movie = moviesList?[indexPath.row] else {
                return UICollectionViewCell()
            }
            
            cell.bind(movie: movie)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: 48)
        }
    
}

extension HomeViewController: UICollectionViewDelegate {
   
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewSize = collectionView.frame.size.width - 31
        return CGSize(width: collectionViewSize / 2, height: 338)
    }
   
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
