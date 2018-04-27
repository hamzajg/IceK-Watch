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
    var series : [Serie] = []
    var activityIndicator = UIActivityIndicatorView()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        let serie = series[indexPath.row]
        cell.displaySerieContent(serie: serie)
        return cell
    }
    

    @IBOutlet weak var seriesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        services.getAllSeriesPageableAsync(pageStart: 1, pageEnd: 25){
            (s) in self.series = (s)
            self.seriesCollectionView.reloadData()
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
        if segue.identifier == "ShowSerieDetails" {
            if let destination = segue.destination as? ItemDetailsViewController{
                let cell = sender as! UICollectionViewCell
                let indexPath = seriesCollectionView.indexPath(for: cell)
                let selectedData = series[(indexPath?.row)!]
                destination.serie = selectedData
            }
        }
    }
    

}
