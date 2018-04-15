//
//  Anime.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-14.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation
import UIKit

class Anime : Codable
{
    var idanime : Int64
    var nom : String
    var description : String
    var categorie : String
    var note : Float
    var img : String
    var nbpart : Int
    var parts: [Part]
    
    init(idanime: Int64, nom: String, description: String, categorie: String, note: Float, img: String, nbpart: Int, parts: [Part]) {
        
        self.idanime = idanime
        self.nom = nom
        self.description = description
        self.categorie = categorie
        self.note = note
        self.img = img
        self.nbpart = nbpart
        self.parts = parts
    }
}
