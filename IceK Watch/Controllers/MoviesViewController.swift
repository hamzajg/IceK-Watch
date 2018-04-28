//
//  MoviesViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-05.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    let services = ServicesImpl.Instance
    var movies : [Movie] = []
    var activityIndicator = UIActivityIndicatorView()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        let movie = movies[indexPath.row]
        cell.displayMovieContent(movie: movie)
        let lastItem = movies.count - 1
        if indexPath.row == lastItem {
            loadMore()
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/3.2, height: 100)
    }
    
    func loadMore() {
        activityIndicator.startAnimating()
        services.getAllMoviesPageableAsync(pageStart: self.movies.count, pageEnd: self.movies.count + 12){
            (m) in
            let data = (m)
            self.movies += data
            self.moviesCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        services.getAllMoviesPageableAsync(pageStart: 1, pageEnd: 12){
            (m) in self.movies = (m)
            self.moviesCollectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }

        // Do any additional setup after loading the view.
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
        if segue.identifier == "ShowMovieDetails" {
            if let destination = segue.destination as? MovieViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = moviesCollectionView.indexPath(for: cell)
                let selectedData = movies[(indexPath?.row)!]
                destination.movie = selectedData
            }
        }
    }
    

}
