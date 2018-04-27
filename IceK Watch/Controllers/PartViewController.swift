//
//  PartViewController.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-15.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit
import AVKit

class PartViewController: UIViewController {

    @IBOutlet weak var videoPlayerView: UIView!
    let services = ServicesImpl.Instance
    var serie: Serie?
    var anime: Anime?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(anime != nil) {
            services.getOneAnimeByAnimeIdAsync(animeId: (anime?.idanime)!){
                (a) in
                let anime = (a)
                print(anime.parts.count)
            }
        } else if(serie != nil) {
            services.getOneSerieBySerieIdAsync(serieId: (serie?.idserie)!){
                (s) in
                let serie = (s)
                print(serie.parts.count)
            }
        }
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.addChildViewController(playerController)
        playerController.view.frame = self.videoPlayerView.bounds
        videoPlayerView.addSubview(playerController.view)
        player.play()
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
