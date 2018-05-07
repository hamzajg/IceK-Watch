//
//  MovieViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-02.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit
import AVKit
import GoogleMobileAds

class MovieViewController: UIViewController, GADInterstitialDelegate{

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemRatingLabel: UILabel!
    @IBOutlet weak var itemDescTextView: UITextView!
    @IBOutlet weak var itemCategoryLabel: UILabel!
    var interstitial: GADInterstitial!
    var movie: Movie?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        interstitial = createAndLoadInterstitial()
       if movie != nil {
            self.title = movie?.nom
        downloadImageToUIImageView(imageView: itemImageView, urlString: (movie?.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))!)
        itemRatingLabel.text?.append(" " + String(movie!.note))
        itemCategoryLabel.text?.append(" " + String(movie!.categorie))
        itemDescTextView.text = movie?.description
        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: "ca-app-pub-4599577559313460/1320958444")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
    }
    @IBAction func btnPlayClicked(_ sender: UIButton) {
        if(movie != nil) {
            if let url = NSURL(string: movie!.video.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)) {
                let video = AVPlayer(url: url as URL)
                let videoPlayer = AVPlayerViewController()
                videoPlayer.player = video
                present(videoPlayer, animated: true, completion: {
                    video.play()
                })
            }
        }
    }
    
    func downloadImageToUIImageView(imageView: UIImageView, urlString:String) {
        do {
            let url = URL(string: urlString)
            if(url != nil) {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data!)
                    }
                }
            }
        } catch {
            imageView.image = UIImage(named: "image")
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
