//
//  DetailsVC.swift
//  MovieApp
//
//  Created by Hakan Adanur on 12.01.2023.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet private weak var selectedMovieName: UILabel!
    @IBOutlet private weak var selectedMovieRating: UILabel!
    @IBOutlet private weak var selectedMovieType1: UILabel!
    @IBOutlet private weak var selectedMovieType2: UILabel!
    @IBOutlet private weak var selectedMovieType3: UILabel!
    @IBOutlet private weak var selectedMovieLength: UILabel!
    @IBOutlet private weak var selectedMovieLanguage: UILabel!
    @IBOutlet private weak var selectedMovieRating2: UILabel!
    @IBOutlet private weak var selectedMovieDescription: UILabel!
    
    private var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let detailsCell = UINib(nibName: "DetailsCell", bundle: nil)
        collectionView.register(detailsCell, forCellWithReuseIdentifier: "detailsCell")

        collectionView.delegate = self
        collectionView.dataSource = self

        selectedMovieName.text = movie.original_title
        selectedMovieDescription.text = movie.overview
        selectedMovieLanguage.text = movie.original_language
    }
    
}

extension DetailsVC {
    static func create(movie: Movie) -> DetailsVC {
        let vc = DetailsVC(nibName: "DetailsVC", bundle: nil)
        vc.movie = movie
        return vc
    }
}

extension DetailsVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCell", for: indexPath) as! DetailsCell
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 74, height: 100)
    }
    
}
