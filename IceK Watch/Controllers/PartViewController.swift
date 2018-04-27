//
//  PartViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-15.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit
import AVKit

class PartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
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
                cell.displayEpisodeContent(episode: episode!, imgUrl: (anime?.img)!)
            }
        } else if(serie != nil) {
            if(indexPath.row != -1) {
                let episode = serie?.parts[(serie?.parts.count)! - 1].episodes[indexPath.row]
                cell.displayEpisodeContent(episode: episode!, imgUrl: (serie?.img)!)
            }
        }
        return cell
    }
    

    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var episodesTableView: UITableView!
    let services = ServicesImpl.Instance
    var serie: Serie?
    var anime: Anime?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(anime != nil) {
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
                                    let player = AVPlayer(url: videoURL!)
                                    let playerController = AVPlayerViewController()
                                    playerController.player = player
                                    self.addChildViewController(playerController)
                                    playerController.view.frame = self.videoPlayerView.bounds
                                    self.videoPlayerView.addSubview(playerController.view)
                                    player.play()
                                }
                            }
                        }
                    }
                }
            }
        } else if(serie != nil) {
            services.getOneSerieBySerieIdAsync(serieId: (serie?.idserie)!){
                (s) in
                let serie = (s)
                if(serie != nil) {
                    if(serie.parts.count > 0) {
                        let lastPart = serie.parts[serie.parts.count - 1]
                        if(lastPart != nil) {
                            if(lastPart.episodes.count > 0) {
                                let lastEp = lastPart.episodes[lastPart.episodes.count - 1]
                                if(lastEp != nil) {
                                    let videoURL = URL(string: lastEp.video.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
                                    let player = AVPlayer(url: videoURL!)
                                    let playerController = AVPlayerViewController()
                                    playerController.player = player
                                    self.addChildViewController(playerController)
                                    playerController.view.frame = self.videoPlayerView.bounds
                                    self.videoPlayerView.addSubview(playerController.view)
                                    player.play()
                                }
                            }
                        }
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
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
