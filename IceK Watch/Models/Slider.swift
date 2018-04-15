//
//  Slider.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-15.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation

import UIKit

class Slider : Codable
{
    var id : Int64
    var url : String
    
    init(id: Int64, url: String) {
        
        self.id = id
        self.url = url
    }
}
