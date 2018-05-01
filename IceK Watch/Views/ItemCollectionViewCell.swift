//
//  ItemCollectionViewCell.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-05.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        Alamofire.request(url).responseImage { response in
            
            if let image = response.result.value {
                self.image = image
            }
        }
        /*URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()*/
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
        itemImageView.downloadedFrom(link: serie.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
        itemTitleLabel.text = serie.nom
    }
    func displayAnimeContent(anime: Anime) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: anime.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
        itemTitleLabel.text = anime.nom
    }
    func displayMovieContent(movie: Movie) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: movie.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
        itemTitleLabel.text = movie.nom
    }
    func displayMovieImgContent(movie: Movie) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: movie.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
    }
    func displaySerieImgContent(serie: Serie) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: serie.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
    }
    func displayAnimeImgContent(anime: Anime) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: anime.img.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
    }
    func displayImgContent(item: Item) {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.downloadedFrom(link: item.itemImage.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil))
    }
//    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            completion(data, response, error)
//            }.resume()
//    }
//    func downloadImage(url: URL) {
//        print("Download Started")
//        getDataFromUrl(url: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            DispatchQueue.main.async() {
//                self.itemImageView.image = UIImage(data: data)
//            }
//        }
//    }
}
