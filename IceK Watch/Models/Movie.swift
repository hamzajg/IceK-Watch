//
//  Movie.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-03.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation
import UIKit

class Movie : Codable
{
    var idmovies : Int64
    var nom : String
    var description : String
    var categorie : String
    var video : String
    var note : Float
    var img : String
    
    init(idmovies: Int64, nom: String, description: String, categorie: String, video: String, note: Float, img: String) {
        
        self.idmovies = idmovies
        self.nom = nom
        self.description = description
        self.categorie = categorie
        self.video = video
        self.note = note
        self.img = img
    }
}
