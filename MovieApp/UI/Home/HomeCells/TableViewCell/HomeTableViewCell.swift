//
//  HomeTableViewCell.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell{
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieName: UILabel!
    @IBOutlet private weak var movieRating: UILabel!
    @IBOutlet private weak var ratingImage: UIImageView!
    @IBOutlet private weak var movieType1: UILabel!
    @IBOutlet private weak var movieType2: UILabel!
    @IBOutlet private weak var movieType3: UILabel!
    @IBOutlet private weak var movieTime: UILabel!
    @IBOutlet private weak var timeImage: UIImageView!
    
    func configure(movie: Movie){
        movieName.text = movie.original_title
        movieTime.text = String(describing: movie.vote_average)
        
        // SETUP UI
        ratingImage.image = UIImage(named: "star")
        timeImage.image = UIImage(named: "clock")
        movieImage.layer.cornerRadius = 12
    }
}
