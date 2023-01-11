//
//  HomeTableViewCell.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell{
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var movieType1: UILabel!
    @IBOutlet weak var movieType2: UILabel!
    @IBOutlet weak var movieType3: UILabel!
    @IBOutlet weak var movieTime: UILabel!
    @IBOutlet weak var timeImage: UIImageView!
    
    
    func configure(){
        ratingImage.image = UIImage(named: "star")
        timeImage.image = UIImage(named: "clock")
        movieImage.layer.cornerRadius = 12
    }
}
