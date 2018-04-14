//
//  Serie.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-14.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation

import UIKit

class Serie : Codable
{
    var idserie : Int64
    var nom : String
    var description : String
    var categorie : String
    var note : Float
    var img : String
    var nbpart : Int
    
    init(idserie: Int64, nom: String, description: String, categorie: String, note: Float, img: String, nbpart: Int) {
        
        self.idserie = idserie
        self.nom = nom
        self.description = description
        self.categorie = categorie
        self.note = note
        self.img = img
        self.nbpart = nbpart
    }
}
