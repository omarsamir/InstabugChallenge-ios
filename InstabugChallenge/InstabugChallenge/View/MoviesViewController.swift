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
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    moviesInteractor.delegate = self
    moviesTableView.delegate = self
    moviesTableView.dataSource = self
    moviesTableView.register( UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCellId")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    if self.screenType == .ALL_MOVIES {
      self.title = "All Movies"
      self.activityIndicator.isHidden = false
      moviesInteractor.getMovies(page: moviesPage)
    }else if self.screenType == .MY_MOVIES {
      self.title = "My Movies"
      self.moviesList = APIClient.shared.myMoviesArray
      moviesTableView.reloadData()
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToCreateMyMovieScreen))
    }
  }
  
  @objc func navigateToCreateMyMovieScreen(){
    let createMymoviesVC = CreateNewMovieViewController(nibName: String(describing: CreateNewMovieViewController.self), bundle: nil)
    self.navigationController?.pushViewController(createMymoviesVC, animated: true)
  }
  
}

extension MoviesViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    if self.screenType == .ALL_MOVIES && indexPath.row == self.moviesList.count - 1 {
      moviesPage += 1
      self.activityIndicator.isHidden = false
      moviesInteractor.getMovies(page: moviesPage)
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
    
    if !movie.is_offline && movie.poster_path != "" {
      APIClient.shared.loadImageFromURL(urlString: (movie.poster_path.imageURL())) { (image, error) in
        cell.movieImage.image = image
      }
    } else if movie.is_offline {
      cell.movieImage.image = UIImage(data:movie.posterData,scale:1.0)
    }
    cell.movieTitle.text = movie.title
    cell.movieOverview.text = movie.overview
    cell.movieDate.text = movie.release_date
    return cell
  }
  
  
}

extension MoviesViewController: MoviesInteractorDelegate {
  func display(movies: Movies) {
    self.activityIndicator.isHidden = true
    self.moviesList += movies.results ?? Array()
    self.moviesTableView.reloadData()
  }
  
  func display(error: Error) {
    
  }
  
  
}
