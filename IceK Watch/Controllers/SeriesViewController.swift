//
//  SeriesViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-06.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit

class SeriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let services = ServicesImpl.Instance
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.getAllSeries().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        let serie = services.getAllSeries()[indexPath.row]
        cell.displayContent(item: serie)
        return cell
    }
    

    @IBOutlet weak var seriesCollectionView: UICollectionView!
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
        if segue.identifier == "ShowSerieDetails" {
            if let destination = segue.destination as? ItemDetailsViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = seriesCollectionView.indexPath(for: cell)
                let selectedData = services.getAllSeries()[(indexPath?.row)!]
                destination.item = selectedData
            }
        }
    }
    

}
