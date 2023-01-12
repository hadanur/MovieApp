//
//  ShowingMovieModel.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation

struct NowShowingMovieModel: Codable {
    let results: [NowShowingMovie]
}

struct NowShowingMovie: Codable {
    let id : Int?
    let original_title: String?
    let overview: String?
    let original_language: String?
    // let vote_average: String?
    // let popularity: String?
    let release_date: String?
    
}
