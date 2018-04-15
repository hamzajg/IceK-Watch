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
    let services = ServicesImpl.Instance
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
        services.getAllMoviesAsync(){
            (m) in self.movies = (m)
            self.recentMoviesCollectionView.reloadData()
        }
        services.getAllSeriesAsync(){
            (s) in self.series = (s)
            self.recentSeriesCollectionView.reloadData()
        }
        services.getAllAnimesAsync(){
            (a) in self.animes = (a)
            self.recentAnimesCollectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
