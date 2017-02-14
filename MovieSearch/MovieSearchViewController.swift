//
//  MovieSearchViewController.swift
//  MovieSearch
//
//  Created by James Campagno on 2/14/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let movieAPI = MovieAPI()
    var movies: [Movie] = []

  @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var searchTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
      self.automaticallyAdjustsScrollViewInsets = false

    }
    
    func searchFilm(with title: String) {
        movies.removeAll()
        parseJSON(json: movieAPI.searchFilm(title: title)!)
        self.tableView.reloadData()
    }

    func parseJSON(json: [String : Any]){
      let json = json["Search"] as? [[String : String]]
      for entry in json! {
        let movie = Movie(dict: entry)
        movies.append(movie)
      }
    }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.movies.count
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
    let movie = movies[indexPath.row]
    cell.titleLabel.text = movie.title
    cell.yearLabel.text = movie.year
    cell.imdbIDLabel.text = "IMDB ID: " + movie.imdbID
    cell.posterView.image = movie.posterImage
    return cell
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let dest = segue.destination as! PosterViewController
    guard let indexPath = tableView.indexPathForSelectedRow,
      let image = movies[indexPath.row].posterImage else {
      dest.posterImageView.image = nil
      return
    }
    dest.image = image
  }

}


// MARK: - UITextFieldDelegate
extension MovieSearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let title = textField.text ?? "No Text"
        searchFilm(with: title)
        textField.resignFirstResponder()
        return true
    }
    
}
