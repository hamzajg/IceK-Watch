//
//  ItemCollectionViewCell.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-05.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    func displayContent(item: Item) {
        itemImageView.image = UIImage(named: "Image")
        itemTitleLabel.text = item.itemTitle
    }
}
