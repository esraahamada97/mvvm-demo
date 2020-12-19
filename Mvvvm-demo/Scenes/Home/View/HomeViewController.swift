//
//  HomeViewController.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/8/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import SwiftPullToRefresh
import RxSwift
import RxCocoa
class HomeViewController: BaseViewController {
    
    // MARK: - Private Variables
    private var homeViewModel: HomeViewModel?
     private var movieList: [MovieModel] = []
    private var isLoadMore = false
    private let disposeBag = DisposeBag()

       func bindViewModel() {
           let page = PublishSubject<Int>()
        let input = HomeViewModel.Input(page: page)
        let output = homeViewModel?.fetchMovies(input)
        output?.dataDriver.drive().
        
        output?.dataDriver.drive(moviesCollectionView.rx.items) { tableView, index, element in
               var cell: MovieCell! // create and assign
            cell.bindViewModel(viewModel: element, buttonClicked: page.asObserver())
            return cell
           }
           .disposed(by: disposeBag)
       }
    // MARK: - Public Variables
    
    // MARK: - IBOutletes
    @IBOutlet private weak var moviesCollectionView: UICollectionView!
    
    // MARK: - Computed Variables
    //remove variable because there is one list only so put it in extension and methods
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
        bindViewModel()
        //requestData()
        
//        fireMoviesListeners()
//        fireMoviesDetailsListeners()
//        postMovieRateSuccess()
        
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
        //send perpage
//        output.dataDriver.drive(tableView.rx.items) { tableView, index, element in
//                    var cell: TableViewCell! // create and assign
//                    cell.bindViewModel(viewModel: element, buttonClicked: buttonClicked.asObserver())
//                    return cell
//                }
//                .disposed(by: disposeBag)
//
//        // add this line you can provide the cell size from delegate method
//        moviesCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
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
//           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.homeViewModel?.fetchMovies(1)
//           }
       }
    
    private func loadMore() {

//        let currentPage = homeViewModel?.movies.value?.page ?? 0
//        if currentPage < homeViewModel?.movies.value?.totalPages ?? 0 {
//            isLoadMore = true
//            homeViewModel?.fetchMovies(page: currentPage + 1)
//        } else {
//            moviesCollectionView.spr_endRefreshing()
//        }
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
            
        return movieList.count
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: MovieCell.className,
                    for: indexPath) as? MovieCell else {
                        return UICollectionViewCell() }
             let movie = movieList[indexPath.row]
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
        return CGSize(width: collectionViewSize / 2, height: 360)
    }
   
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
