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
    var item: Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if item != nil {
            itemRatingLabel.text?.append(" " + String(item!.itemRating))
            itemDescTextView.text = item?.itemDesc
        }
    }
    
    @IBAction func btnPlayClicked(_ sender: UIButton) {
        if item != nil {
            if let url = NSURL(string: item!.itemMediaURL) {
                let video = AVPlayer(url: url as URL)
                let videoPlayer = AVPlayerViewController()
                videoPlayer.player = video
                present(videoPlayer, animated: true, completion: {
                    video.play()
                    })
            }
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
