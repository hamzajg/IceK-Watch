//
//  ItemCollectionViewCell.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-05.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    func displayContent(item: Item) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.image = UIImage(named: "Image")
        itemTitleLabel.text = item.itemTitle
    }
    func displaySerieContent(serie: Serie) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: serie.img)
        itemTitleLabel.text = serie.nom
    }
    func displayAnimeContent(anime: Anime) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: anime.img)
        itemTitleLabel.text = anime.nom
    }
    func displayMovieContent(movie: Movie) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: movie.img)
        itemTitleLabel.text = movie.nom
    }
    func displayMovieImgContent(movie: Movie) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: movie.img)
    }
    func displayImgContent(item: Item) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: item.itemImage)
    }
}
