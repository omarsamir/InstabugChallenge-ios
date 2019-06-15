//
//  Extentions.swift
//  InstabugChallenge
//
//  Created by Admin on 6/15/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import UIKit

extension String {
  func imageURL() -> String {
    return Constants.IMAGES_BASEURL+self
  }
}

extension Date {
  func toString() -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: self)
  }
}
