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

class MoviesViewController: UIViewController {
  var screenType : ScreenType?
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

  override func viewDidAppear(_ animated: Bool) {
    if self.screenType == .ALL_MOVIES {
      self.view.backgroundColor = .blue
    }else if self.screenType == .MY_MOVIES {
      self.view.backgroundColor = .orange
    }
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
