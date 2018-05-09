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

class MovieViewController: UIViewController, GADInterstitialDelegate, GADBannerViewDelegate, UIAlertViewDelegate {
    
    // Ad banner and interstitial views
    var adMobBannerView = GADBannerView()

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
        // Init AdMob banner
        initAdMobBanner()
        // Do any additional setup after loading the view.
    }
    // MARK: -  ADMOB BANNER
    func initAdMobBanner() {
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            // iPhone
            adMobBannerView.adSize =  GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
            adMobBannerView.frame = CGRect(x: 0, y: view.frame.size.height, width: 320, height: 50)
        } else  {
            // iPad
            adMobBannerView.adSize =  GADAdSizeFromCGSize(CGSize(width: 468, height: 60))
            adMobBannerView.frame = CGRect(x: 0, y: view.frame.size.height, width: 468, height: 60)
        }
        
        adMobBannerView.adUnitID = "ca-app-pub-4599577559313460/5202355526"
        adMobBannerView.rootViewController = self
        adMobBannerView.delegate = self
        view.addSubview(adMobBannerView)
        
        let request = GADRequest()
        adMobBannerView.load(request)
    }
    
    
    // Hide the banner
    func hideBanner(_ banner: UIView) {
        UIView.beginAnimations("hideBanner", context: nil)
        banner.frame = CGRect(x: view.frame.size.width/2 - banner.frame.size.width/2, y: view.frame.size.height - banner.frame.size.height, width: banner.frame.size.width, height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = true
    }
    
    // Show the banner
    func showBanner(_ banner: UIView) {
        UIView.beginAnimations("showBanner", context: nil)
        banner.frame = CGRect(x: view.frame.size.width/2 - banner.frame.size.width/2, y: (view.frame.size.height - banner.frame.size.height) - 55, width: banner.frame.size.width, height: banner.frame.size.height)
        UIView.commitAnimations()
        banner.isHidden = false
    }
    
    // AdMob banner available
    func adViewDidReceiveAd(_ view: GADBannerView!) {
        showBanner(adMobBannerView)
    }
    
    // NO AdMob banner available
    func adView(_ view: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        hideBanner(adMobBannerView)
    }
    func createAndLoadInterstitial() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: "ca-app-pub-4599577559313460/3245318169")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    var lastTimeInterval:TimeInterval? = nil
    func interstitialDidReceiveAd(_ ad: GADInterstitial!) {
        if(lastTimeInterval == nil || (Date().timeIntervalSinceNow - lastTimeInterval!) > 250.0) {
            print("Interstitial loaded successfully")
            ad.present(fromRootViewController: self)
            lastTimeInterval = Date().timeIntervalSinceNow
        }
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial!) {
        print("Fail to receive interstitial")
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
                self.interstitial.present(fromRootViewController: (videoPlayer.presentationController?.presentingViewController)!)
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
