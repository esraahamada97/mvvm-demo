//
//  MovieCell.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit
import RxSwift

class MovieCell: UICollectionViewCell {

    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    private var disposeBag = DisposeBag()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindViewModel<O>(viewModel: MovieModel, buttonClicked: O) where O: ObserverType, O.Element == Int {
        let imageURL = "https://image.tmdb.org/t/p/w500/"+(viewModel.posterPath ?? "")
                 
            //emit the cell's viewModel id when the button is clicked for identification purposes.
        titleLabel.rx.observe(String.self, viewModel.title ?? "")
                .subscribe(onNext: { text in
                    print(text ?? "")
                })
                .disposed(by: disposeBag)
        }
    func bind(movie: MovieModel) {
        let imageURL = "https://image.tmdb.org/t/p/w500/"+(movie.posterPath ?? "")
        movieImageView.loadImageFromUrl(urlString: imageURL, placeHolderImage: nil)
        titleLabel.text = movie.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        movieImageView.image = nil
    }
}
