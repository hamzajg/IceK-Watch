//
//  AnimesViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-06.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit

class AnimesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let services = ServicesImpl.AnimesInstance

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.animes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        let anime = services.animes[indexPath.row]
        cell.displayContent(item: anime)
        return cell
    }
    

    @IBOutlet weak var animesCollectionView: UICollectionView!
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
        if segue.identifier == "ShowAnimeDetails" {
            if let destination = segue.destination as? ItemDetailsViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = animesCollectionView.indexPath(for: cell)
                let selectedData = services.animes[(indexPath?.row)!]
                destination.item = selectedData
            }
        }
    }
    

}
