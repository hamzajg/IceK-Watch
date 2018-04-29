//
//  ItemDetailsViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-03.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit
import AVKit

class ItemDetailsViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemRatingLabel: UILabel!
    @IBOutlet weak var itemDescTextView: UITextView!
    @IBOutlet weak var itemCategoryLabel: UILabel!
    var movie: Movie?
    var serie: Serie?
    var anime: Anime?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if movie != nil {
            self.title = movie?.nom
            let url = URL(string: (movie?.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))!)
            
            if(url != nil) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    DispatchQueue.main.async {
                        self.itemImageView.image = UIImage(data: data!)
                    }
                }
            } else{
                itemImageView.image = UIImage(named: "Image")
            }
            itemRatingLabel.text?.append(" " + String(movie!.note))
            itemCategoryLabel.text = movie?.categorie
            itemDescTextView.text = movie?.description
        } else if serie != nil {
            self.title = serie?.nom
            let url = URL(string: (serie?.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))!)
            
            if(url != nil) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    DispatchQueue.main.async {
                        self.itemImageView.image = UIImage(data: data!)
                    }
                }
            } else{
                itemImageView.image = UIImage(named: "Image")
            }
            itemRatingLabel.text?.append(" " + String(serie!.note))
            itemCategoryLabel.text = serie?.categorie
            itemDescTextView.text = serie?.description
        } else if anime != nil {
            self.title = anime?.nom
            let url = URL(string: (anime?.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))!)
            
            if(url != nil) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    DispatchQueue.main.async {
                        self.itemImageView.image = UIImage(data: data!)
                    }
                }
            } else{
                itemImageView.image = UIImage(named: "Image")
            }
            itemRatingLabel.text?.append(" " + String(anime!.note))
            itemCategoryLabel.text = anime?.categorie
            itemDescTextView.text = anime?.description
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
        if(serie != nil) {
            if segue.identifier == "ShowPartDetails" {
                if let destination = segue.destination as? PartViewController{
                    destination.serie = serie
                }
            }
        } else if(anime != nil) {
            if segue.identifier == "ShowPartDetails" {
                if let destination = segue.destination as? PartViewController{
                    destination.anime = anime
                }
            }
        }
    }
 

}
