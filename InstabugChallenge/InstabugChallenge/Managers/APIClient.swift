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
  var myMoviesArray = Array<Results>()
  
  func getMovies(page: Int, completion: @escaping (Movies?,Error?) -> ()) {
    print("REQUESTING FROM PAGE = " + String(page))
    let urlPath = Constants.MOVIE_DB_BASEURL + String(page)
    let url = URL(string: urlPath)
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    let requestTask = URLSession.shared.dataTask(with: request) {
      (data: Data?, response: URLResponse?, error: Error?) in
      if error == nil && data != nil {
        do {
          let decoder = JSONDecoder()
          let movies = try decoder.decode(Movies.self, from: data!)
          completion(movies,nil)
        } catch _ {}
      }else{
        print("Error: \(String(describing: error))")
        completion(nil,error)
      }
    }
    requestTask.resume()
  }
  
  func loadImageFromURL(urlString: String, completion: @escaping (UIImage?,Error?) -> ()){
    let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
    URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in
      if error != nil {
        completion(nil,error)
      }
      DispatchQueue.main.async {
        let image = UIImage(data: data!)
        completion(image,nil)
      }
    }).resume()
  }
}


