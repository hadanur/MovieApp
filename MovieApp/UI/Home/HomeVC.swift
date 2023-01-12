//
//  HomeVC.swift
//  MovieApp
//
//  Created by Hakan Adanur on 11.01.2023.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeTableViewCell = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(homeTableViewCell, forCellReuseIdentifier: "homeTableViewCell")
        let homeCollectionViewCell = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        collectionView.register(homeCollectionViewCell, forCellWithReuseIdentifier: "homeCollectionViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.delegate = self
        viewModel.fetchPopularMovies()
        viewModel.fetchNowShowingMovies()
        
        title = "Movies"

    }

}

extension HomeVC {
    static func create() -> HomeVC {
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        return vc
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell") as! HomeTableViewCell
        cell.selectionStyle = .none
        let data = viewModel.popularMovies[indexPath.row]
        cell.configure(movie: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.popularMovies[indexPath.row]
        let detailsVC = DetailsVC.create(movieName: data.original_title, movieDescription: data.overview, movieLanguage: data.original_language)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.nowShowingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let data = viewModel.nowShowingMovies[indexPath.row]
        cell.configure(movie: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 143, height: 283)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = viewModel.nowShowingMovies[indexPath.row]
        let detailsVC = DetailsVC.create(movieName: data.original_title, movieDescription: data.overview, movieLanguage: data.original_language)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}

extension HomeVC: HomeVMDelegate {
    func fetchNowShowingMovies() {
        self.collectionView.reloadData()
    }
    
    func fetchPopularMovies() {
        self.tableView.reloadData()
    }
    
    func fetchError() {
        self.showAlert(title: "Error", message: "Try Again Later")
    }
    
}

