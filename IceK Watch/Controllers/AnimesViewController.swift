//
//  AnimesViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-06.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit

class AnimesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let services = ServicesImpl.Instance
    var animes : [Anime] = []
    var activityIndicator = UIActivityIndicatorView()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        let anime = animes[indexPath.row]
        cell.displayAnimeContent(anime: anime)
        return cell
    }
    

    @IBOutlet weak var animesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        services.getAllAnimesPageableAsync(pageStart: 1, pageEnd: 12){
            (a) in self.animes = (a)
            self.animesCollectionView.reloadData()
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
        if segue.identifier == "ShowAnimeDetails" {
            if let destination = segue.destination as? ItemDetailsViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = animesCollectionView.indexPath(for: cell)
                let selectedData = animes[(indexPath?.row)!]
                destination.anime = selectedData
            }
        }
    }
    

}
