//
//  Part.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-15.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation

import UIKit

class Part : Codable
{
    var idpart : Int64
    var numero : Int
    var episodes: [Episode]
    init(idpart: Int64, numero: Int, episodes: [Episode]) {
        
        self.idpart = idpart
        self.numero = numero
        self.episodes = episodes
    }
}
