//
//  HomeCollectionViewCell.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation
import UIKit

class HomeCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    
    func configure(){
        ratingImage.image = UIImage(named: "star")
        movieImage.layer.cornerRadius = 12
        movieImage.layer.shadowOffset = CGSizeMake(0, 0)
        movieImage.layer.shadowColor = UIColor.systemGray.cgColor
        movieImage.layer.shadowOpacity = 0.33
        movieImage.layer.shadowRadius = 16
    }
}
