//
//  MoviesViewController.swift
//  InstabugChallenge
//
//  Created by Admin on 6/15/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import UIKit

enum ScreenType :String{
  case ALL_MOVIES
  case MY_MOVIES
}

class MoviesViewController: UIViewController{
  var screenType: ScreenType?
  var moviesList = Array<Results>()
  var moviesInteractor = MoviesInteractor()
  var moviesPage = 1
  @IBOutlet weak var moviesTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesInteractor.delegate = self
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
      moviesTableView.register( UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCellId")
      // Do any additional setup after loading the view.
      
    }

  override func viewDidAppear(_ animated: Bool) {
    if self.screenType == .ALL_MOVIES {
      self.title = "All Movies"
    }else if self.screenType == .MY_MOVIES {
      self.title = "My Movies"
    }
    
    moviesInteractor.getMovies(page: moviesPage)
  }

}

extension MoviesViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if indexPath.row == self.moviesList.count - 1 {
      print("reach last cell - get next page")
      moviesPage += 1
      moviesInteractor.getMovies(page: moviesPage)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return UITableView.automaticDimension
    return 168
  }
}
extension MoviesViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.moviesList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell : MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCellId", for: indexPath) as! MovieTableViewCell
    let movie = self.moviesList[indexPath.row]
    cell.movieImage.image = UIImage(named: "image-placeholder")!
    if movie.poster_path != nil {
      APIClient.shared.loadImageFromURL(urlString: (movie.poster_path?.imageURL())!) { (image, error) in
        cell.movieImage.image = image
      }
    }
    cell.movieTitle.text = movie.title
    cell.movieOverview.text = movie.overview
    cell.movieDate.text = movie.release_date
    return cell
  }
  
  
}

extension MoviesViewController: MoviesInteractorDelegate {
  func display(movies: Movies) {
    self.moviesList += movies.results ?? Array()
    self.moviesTableView.reloadData()
  }
  
  func display(error: Error) {
    
  }
  
  
}
