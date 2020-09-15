//
//  MovieCell.swift
//  Mvvvm-demo
//
//  Created by Esraa Abuseada on 9/13/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
