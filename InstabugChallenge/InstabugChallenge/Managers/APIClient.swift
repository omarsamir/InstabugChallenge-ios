//
//  APIClient.swift
//  InstabugChallenge
//
//  Created by Admin on 6/14/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import UIKit

class APIClient: NSObject {
  static let shared = APIClient()
  func getMovies(page: Int, completion: @escaping (Movies?,Error?) -> ()) {
    let urlPath = Constants.MOVIE_DB_BASEURL + String(page)
    let url = URL(string: urlPath)
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    let requestTask = URLSession.shared.dataTask(with: request) {
      (data: Data?, response: URLResponse?, error: Error?) in
        do {
          let decoder = JSONDecoder()
          let movies = try decoder.decode(Movies.self, from: data!)
          completion(movies,nil)
        } catch _ {
          print("Error: \(String(describing: error))")
          completion(nil,error)
        }
    }
    requestTask.resume()
  }
}
