//
//  PopularMovieModel.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation
import UIKit

struct PopularMovieModel: Codable {
    let results: [PopularMovie]
}

struct PopularMovie: Codable {
    let id : Int?
    let original_title: String?
    let overview: String?
    let original_language: String?
    // let vote_average: String?
    // let popularity: String?
    let release_date: String?
    
}

