//
//  Movie.swift
//  IceK Watch
//
//  Created by Hamza JGUERIM on 2018-04-03.
//  Copyright © 2018 Hamza JGUERIM. All rights reserved.
//

import Foundation
import UIKit

class Movie
{
    var movieId : Int64
    var movieTitle : String
    var movieDesc : String
    var movieRating : Int
    var movieImage : String
    
    init(movieId: Int64, movieTitle: String, movieDesc: String, movieRating: Int, movieImage: String) {
        
        self.movieId = movieId
        self.movieTitle = movieTitle
        self.movieDesc = movieDesc
        self.movieRating = movieRating
        self.movieImage = movieImage
    }
}
