//
//  PopularMovieModel.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation
import UIKit

struct MovieBaseModel: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id : Int?
    let original_title: String?
    let overview: String?
    let original_language: String?
     let vote_average: Double?
    // let popularity: String?
    let release_date: String?
    
}

