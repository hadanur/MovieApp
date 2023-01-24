//
//  HomeCollectionViewCell.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation
import UIKit

class HomeCollectionViewCell: UICollectionViewCell{
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieRating: UILabel!
    @IBOutlet private weak var ratingImage: UIImageView!
    
    func configure(movie: Movie){
        movieName.text = movie.original_title
        movieRating.text = movie.release_date
        setupUI()
    }
    
    func setupUI(){
        movieImage.layer.cornerRadius = 12
        movieImage.layer.shadowOffset = CGSizeMake(0, 0)
        movieImage.layer.shadowColor = UIColor.black.cgColor
        movieImage.layer.shadowOpacity = 0.53
        movieImage.layer.shadowRadius = 16
    }
}
