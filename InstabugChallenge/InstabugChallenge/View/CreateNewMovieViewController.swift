//
//  CreateNewMovieViewController.swift
//  InstabugChallenge
//
//  Created by Admin on 6/15/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import UIKit

class CreateNewMovieViewController: UIViewController {

  @IBOutlet weak var myMovieImage: UIImageView!
  @IBOutlet weak var myMovieTitle: UITextField!
  @IBOutlet weak var myMovieOverview: UITextView!
  @IBOutlet weak var addMyMovie: UIButton!
  @IBOutlet weak var movieDatePicker: UIDatePicker!
  var myMovie = Results()

  override func viewDidLoad() {
        super.viewDidLoad()
        myMovie.is_offline = true
        // Do any additional setup after loading the view.
    }
  
  @IBAction func addPhotoFromGallary(_ sender: Any) {
    let myPickerController = UIImagePickerController()
    myPickerController.delegate = self
    myPickerController.sourceType =  UIImagePickerController.SourceType.photoLibrary
    self.present(myPickerController, animated: true, completion: nil)
  }
  
  
  @IBAction func addMovie(_ sender: Any) {
        myMovie.title = myMovieTitle.text!
        myMovie.overview = myMovieOverview.text
        myMovie.release_date = movieDatePicker.date.toString()
        APIClient.shared.myMoviesArray.append(myMovie)
        self.navigationController?.popViewController(animated: true)
  }
  
}
  
extension CreateNewMovieViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image_data = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
    self.myMovieImage.image = image_data
    let imageData:Data = image_data.pngData()!
    myMovie.posterData = imageData
    self.dismiss(animated: true, completion: nil)
  }
}
