//
//  MovieTableViewCell.swift
//  InstabugChallenge
//
//  Created by Admin on 6/15/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

  @IBOutlet weak var movieImage: UIImageView!
  @IBOutlet weak var movieTitle: UILabel!
  @IBOutlet weak var movieOverview: UILabel!
  @IBOutlet weak var movieDate: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
