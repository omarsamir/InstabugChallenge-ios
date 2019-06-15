//
//  MoviesInteractor.swift
//  InstabugChallenge
//
//  Created by Admin on 6/15/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import UIKit
protocol MoviesInteractorDelegate : AnyObject {
  func display(movies: Movies)
  func display(error: Error)
}

class MoviesInteractor: NSObject {
  weak var delegate : MoviesInteractorDelegate?
    func getMovies(page: Int) {
      APIClient.shared.getMovies(page: page) { (movies, error) in
        DispatchQueue.main.async {
          if error == nil && movies != nil {
            self.delegate?.display(movies: movies!)
          }else{
            self.delegate?.display(error: error!)
          }
        }
     }
  }
}
