//
//  Movie.swift
//  Swiftest
//
//  Created by Mark on 6/5/14.
//  Copyright (c) 2014 Mark. All rights reserved.
//

import Foundation

class Movie {
    let posterUrlString : String
    let title : String
    let directors : Array<Dictionary<String,String>>
    let year : String
    let plot : String

    init(dictionary: NSDictionary) {
        posterUrlString = dictionary["urlPoster"] as String
        title = dictionary["title"] as String
        directors = dictionary["directors"] as Array
        year = dictionary["year"] as String
        plot = dictionary["plot"] as String
    }
}