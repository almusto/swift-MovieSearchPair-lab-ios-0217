//
//  Movie.swift
//  MovieSearch
//
//  Created by Alessandro Musto on 2/14/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

struct Movie {

  let title: String
  let year: String
  let imdbID: String
  let type: String
  let poster: String
  let posterImage: UIImage?

  init(dict: [String : String]) {
    self.title = dict["Title"] ?? ""
    self.year = dict["Year"] ?? ""
    self.imdbID = dict["imdbID"] ?? ""
    self.type = dict["Type"] ?? ""
    self.poster = dict["Poster"] ?? ""

    let url = URL(string: self.poster)
    let data = try? Data(contentsOf: url!)
    if let gooddata = data {
      self.posterImage = UIImage(data: gooddata)
    } else {
      self.posterImage = nil
    }

  }

}
