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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == recentMoviesCollectionView) {
            return movies.count > 10 ? 10 : movies.count}
        else {
            return 1;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        if(collectionView == recentMoviesCollectionView) {
            let movie = movies[indexPath.row]
            print(movie.img)
            cell.displayMovieImgContent(movie: movie)
        } else if(collectionView == recentSeriesCollectionView){
            let serie = services.getAllSeries()[indexPath.row]
            cell.displayImgContent(item: serie)
        } else {
            let anime = services.getAllAnimes()[indexPath.row]
            cell.displayImgContent(item: anime)
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        services.getAllMoviesAsync(){
            (m) in self.movies = (m)
            self.recentMoviesCollectionView.reloadData()
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
