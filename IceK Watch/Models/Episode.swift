//
//  Episode.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-15.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation

import UIKit

class Episode : Codable
{
    var idep : Int64
    var numeroep : Int
    var idpart: Int64
    var video: String
    init(idep: Int64, numeroep: Int, idpart: Int64, video: String) {
        
        self.idep = idep
        self.numeroep = numeroep
        self.idpart = idpart
        self.video = video
    }
}
