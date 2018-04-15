//
//  HomeViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-03.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var recentMoviesCollectionView: UICollectionView!
    @IBOutlet weak var recentSeriesCollectionView: UICollectionView!
    @IBOutlet weak var recentAnimesCollectionView: UICollectionView!
    var activityIndicator = UIActivityIndicatorView()
    let services = ServicesImpl.Instance
    var sliders : [Slider] = []
    var movies : [Movie] = []
    var series : [Serie] = []
    var animes : [Anime] = []
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        if(collectionView == recentMoviesCollectionView) {
            if(movies.count > indexPath.row) {
                let movie = movies[indexPath.row]
                cell.displayMovieImgContent(movie: movie)
                print(movie.img)
            }
        } else if(collectionView == recentSeriesCollectionView){
            if(series.count > indexPath.row) {
                let serie = series[indexPath.row]
                cell.displaySerieImgContent(serie: serie)
            }
        } else {
            if(animes.count > indexPath.row) {
                let anime = animes[indexPath.row]
                cell.displayAnimeImgContent(anime: anime)
            }
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        services.getHomeAsync(){
            (h) in
            let home = (h)
            self.sliders = home.sliders
            self.movies = home.movies
            self.series = home.series
            self.animes = home.animes
            self.recentMoviesCollectionView.reloadData()
            self.recentSeriesCollectionView.reloadData()
            self.recentAnimesCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowHMovieDetails" {
            if let destination = segue.destination as? ItemDetailsViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = recentMoviesCollectionView.indexPath(for: cell)
                let selectedData = movies[(indexPath?.row)!]
                destination.movie = selectedData
            }
        } else if segue.identifier == "ShowHSerieDetails" {
            if let destination = segue.destination as? ItemDetailsViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = recentSeriesCollectionView.indexPath(for: cell)
                let selectedData = series[(indexPath?.row)!]
                destination.serie = selectedData
            }
        }else if segue.identifier == "ShowHAnimeDetails" {
            if let destination = segue.destination as? ItemDetailsViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = recentAnimesCollectionView.indexPath(for: cell)
                let selectedData = animes[(indexPath?.row)!]
                destination.anime = selectedData
            }
        }
    }
    

}
