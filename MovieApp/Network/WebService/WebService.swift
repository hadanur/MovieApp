//
//  WebService.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import Foundation

class WebService {
    
    static let shared = WebService()
    
    private init() { }
    
    func downloadPopularMovies(completion : @escaping (PopularMovieModel?) -> ()) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=4b73eb51fdbac9a5e0d2c2107c3e4972&language=en-US&page=1")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let popularMovieList = try JSONDecoder().decode(PopularMovieModel.self, from: data)
                    completion(popularMovieList)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
    
    func downloadNowShowingMovies(completion : @escaping (NowShowingMovieModel?) -> ()) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=4b73eb51fdbac9a5e0d2c2107c3e4972&language=en-US&page=1")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let movieList = try JSONDecoder().decode(NowShowingMovieModel.self, from: data)
                    completion(movieList)
                } catch {
                    print(error.localizedDescription)
                    print(String(describing: error))
                }
            }
        }.resume()
    }
}

