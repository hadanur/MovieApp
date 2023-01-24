//
//  HomeVM.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation
import UIKit

protocol HomeVMDelegate: AnyObject {
    func fetchPopularMovies()
    func fetchError()
    func fetchNowShowingMovies()
}

class HomeVM {
    private let service = WebService.shared
    var popularMovies = [Movie]()
    weak var delegate: HomeVMDelegate?
    var nowShowingMovies = [Movie]()
    
    func fetchPopularMovies() {
        service.downloadPopularMovies { result in
            if let result = result {
                self.popularMovies = result.results
                
                DispatchQueue.main.async {
                    self.delegate?.fetchPopularMovies()
                }
            } else {
                self.delegate?.fetchError()
            }
        }
    }
    
    func fetchNowShowingMovies() {
        service.downloadNowShowingMovies { result in
            if let result = result {
                self.nowShowingMovies = result.results
                
                DispatchQueue.main.async {
                    self.delegate?.fetchNowShowingMovies()
                }
            } else {
                self.delegate?.fetchError()
            }
        }
    }
}
