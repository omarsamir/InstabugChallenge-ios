//
//  Results.swift
//  InstabugChallenge
//
//  Created by Admin on 6/14/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import Foundation
struct Results : Codable {
	var vote_count = 0
	var id = 0
	var video = false
	var vote_average = 0.0
	var title = ""
	var popularity = 0.0
	var poster_path = ""
	var original_language = ""
	var original_title = ""
	var genre_ids =  [Int]()
	var backdrop_path = ""
	var adult = false
	var overview = ""
	var release_date = ""
  var is_offline = false
  var posterData =  Data()

  init() {
    
  }
  
	enum CodingKeys: String, CodingKey {

		case vote_count = "vote_count"
		case id = "id"
		case video = "video"
		case vote_average = "vote_average"
		case title = "title"
		case popularity = "popularity"
		case poster_path = "poster_path"
		case original_language = "original_language"
		case original_title = "original_title"
		case genre_ids = "genre_ids"
    case backdrop_path = "backdrop_path"
		case adult = "adult"
		case overview = "overview"
		case release_date = "release_date"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
    vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count) ?? 0
    id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
    video = try values.decodeIfPresent(Bool.self, forKey: .video) ?? false
		vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average) ?? 0.0
		title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity) ?? 0.0
		poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path) ?? ""
		original_language = try values.decodeIfPresent(String.self, forKey: .original_language) ?? ""
		original_title = try values.decodeIfPresent(String.self, forKey: .original_title) ?? ""
		genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids) ?? [Int]()
    backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path) ?? ""
    adult = try values.decodeIfPresent(Bool.self, forKey: .adult) ?? false
		overview = try values.decodeIfPresent(String.self, forKey: .overview) ?? ""
		release_date = try values.decodeIfPresent(String.self, forKey: .release_date) ?? ""
	}

}
