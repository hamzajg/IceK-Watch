//
//  EpisodeTableViewCell.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-27.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodePartLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func displayEpisodeContent(episode: Episode, imgUrl: String) {
        episodeImageView.contentMode = .scaleAspectFill
        episodeImageView.downloadedFrom(link: imgUrl.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
        episodeTitleLabel.text = String(episode.numeroep)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
