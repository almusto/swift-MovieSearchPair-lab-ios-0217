//
//  PosterViewController.swift
//  MovieSearch
//
//  Created by Alessandro Musto on 2/14/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class PosterViewController: UIViewController {

  @IBOutlet weak var posterImageView: UIImageView!
  var image: UIImage!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.posterImageView.image = image
    }



}
