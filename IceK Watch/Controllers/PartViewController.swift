//
//  PartViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-15.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit
import AVKit
import GoogleMobileAds


class PartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GADBannerViewDelegate {
    
    // Ad banner and interstitial views
    var adMobBannerView = GADBannerView()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(anime != nil) {
            return (anime?.parts.count)! > 0 ? (anime?.parts[(anime?.parts.count)! - 1].episodes.count)! : 0
        } else if(serie != nil) {
            return (serie?.parts.count)! > 0 ? (serie?.parts[(serie?.parts.count)! - 1].episodes.count)! : 0
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as! EpisodeTableViewCell
        if(anime != nil) {
            if(indexPath.row != -1) {
                let episode = anime?.parts[(anime?.parts.count)! - 1].episodes[indexPath.row]
                cell.displayEpisodeContent(episode: episode!, imgUrl: (anime?.img)!, numPart: (anime?.parts[(anime?.parts.count)! - 1].numero)!)
            }
        } else if(serie != nil) {
            if(indexPath.row != -1) {
                let episode = serie?.parts[(serie?.parts.count)! - 1].episodes[indexPath.row]
                cell.displayEpisodeContent(episode: episode!, imgUrl: (serie?.img)!, numPart: (serie?.parts[(serie?.parts.count)! - 1].numero)!)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        if(anime != nil) {
            if((anime?.parts.count)! > 0) {
                let lastPart = anime?.parts[(anime?.parts.count)! - 1]
                if(lastPart != nil) {
                    if((lastPart?.episodes.count)! > 0) {
                        let lastEp = lastPart?.episodes[selectedIndex]
                        if(lastEp != nil) {
                            let videoURL = URL(string: (lastEp?.video.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))!)
                            if(player != nil) {
                                player.pause()
                            }
                            player = AVPlayer(url: videoURL!)
                            playerController.player = self.player
                            player.play()
                        }
                    }
                }
            }
        } else if(serie != nil) {
            if((serie?.parts.count)! > 0) {
                let lastPart = serie?.parts[(serie?.parts.count)! - 1]
                if(lastPart != nil) {
                    if((lastPart?.episodes.count)! > 0) {
                        let lastEp = lastPart?.episodes[selectedIndex]
                        if(lastEp != nil) {
                            let videoURL = URL(string: (lastEp?.video.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))!)
                            if(player != nil) {
                                player.pause()
                            }
                            player = AVPlayer(url: videoURL!)
                            playerController.player = self.player
                            player.play()
                        }
                    }
                }
            }
        }
    }
    var player:AVPlayer = AVPlayer()
    var playerController = AVPlayerViewController()
    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var episodesTableView: UITableView!
    let services = ServicesImpl.Instance
    var serie: Serie?
    var anime: Anime?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(playerController)
        playerController.view.frame = self.videoPlayerView.bounds
        self.videoPlayerView.addSubview(playerController.view)
        if(anime != nil) {
            self.title = anime?.nom
            services.getOneAnimeByAnimeIdAsync(animeId: (anime?.idanime)!){
                (a) in
                let anime = (a)
                self.anime?.parts = anime.parts
                self.episodesTableView.reloadData()
                if(anime != nil) {
                    if(anime.parts.count > 0) {
                        let lastPart = anime.parts[anime.parts.count - 1]
                        if(lastPart != nil) {
                            if(lastPart.episodes.count > 0) {
                                let lastEp = lastPart.episodes[lastPart.episodes.count - 1]
                                if(lastEp != nil) {
                                    let videoURL = URL(string: lastEp.video.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
                                    self.player = AVPlayer(url: videoURL!)
                                    self.playerController.player = self.player
                                    self.player.play()
                                }
                            }
                        }
                    }
                }
            }
        } else if(serie != nil) {
            self.title = serie?.nom
            services.getOneSerieBySerieIdAsync(serieId: (serie?.idserie)!){
                (s) in
                let serie = (s)
                self.serie?.parts = serie.parts
                self.episodesTableView.reloadData()
                if(serie != nil) {
                    if(serie.parts.count > 0) {
                        let lastPart = serie.parts[serie.parts.count - 1]
                        if(lastPart != nil) {
                            if(lastPart.episodes.count > 0) {
                                let lastEp = lastPart.episodes[lastPart.episodes.count - 1]
                                if(lastEp != nil) {
                                    let videoURL = URL(string: lastEp.video.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
                                    self.player = AVPlayer(url: videoURL!)
                                    self.playerController.player = self.player
                                    self.player.play()
                                }
                            }
                        }
                    }
                }
            }
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
        
        adMobBannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
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
