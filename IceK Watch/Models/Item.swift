//
//  Item.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-05.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    var itemId : Int64
    var itemTitle : String
    var itemDesc : String
    var itemRating : Float
    var itemImage : String
    var itemMediaURL : String
    var itemType : String
    
    init(itemId: Int64, itemTitle: String, itemDesc: String,
         itemRating: Float, itemImage: String, itemMediaURL: String, itemType: String) {
        
        self.itemId = itemId
        self.itemTitle = itemTitle
        self.itemDesc = itemDesc
        self.itemRating = itemRating
        self.itemImage = itemImage
        self.itemMediaURL = itemMediaURL
        self.itemType = itemType
    }
}
