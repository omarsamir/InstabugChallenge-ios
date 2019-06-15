//
//  UIManager.swift
//  InstabugChallenge
//
//  Created by Admin on 6/15/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import UIKit

class UIManager: NSObject {
  static let shared = UIManager()
  func moviesNavigationController(screenType: ScreenType) -> UINavigationController {
    let moviesVC = MoviesViewController(nibName: String(describing: MoviesViewController.self), bundle: nil)
    moviesVC.screenType = screenType
    let moviesNavigationController = UINavigationController()
    moviesNavigationController.navigationBar.isTranslucent = false
    moviesNavigationController.viewControllers = [moviesVC]
    return moviesNavigationController;
  }
  
  func mainTabbarController() -> UITabBarController{
    let tabBarController = UITabBarController()
    let allMoviesVC = UIManager.shared.moviesNavigationController(screenType: .ALL_MOVIES)
    let myMoviesVC = UIManager.shared.moviesNavigationController(screenType: .MY_MOVIES)
    
    allMoviesVC.tabBarItem = UITabBarItem(title: "All Movies", image: UIImage(named: "allmovies-tabbar-icon"), tag: 0)
    myMoviesVC.tabBarItem = UITabBarItem(title:"My Movies" ,image: UIImage(named: "mymovies-tabbar-icon"), tag: 1)
    let controllers = [allMoviesVC, myMoviesVC]
    tabBarController.viewControllers = controllers
    return tabBarController
  }
  
  func errorAlert(errorMessage: String) -> UIAlertController{
    let errorAlert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
    return errorAlert
  }
}
