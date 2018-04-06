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
    let services = ServicesImpl.MoviesInstance
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        let movie = services.movies[indexPath.row]
        cell.displayContent(item: movie)
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/3.2, height: 100)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        if segue.identifier == "ShowItemDetails" {
            if let destination = segue.destination as? ItemDetailsViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = moviesCollectionView.indexPath(for: cell)
                let selectedData = services.movies[(indexPath?.row)!]
                destination.item = selectedData
            }
        }
    }
    

}
