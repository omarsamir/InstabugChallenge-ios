//
//  Movies.swift
//  InstabugChallenge
//
//  Created by Admin on 6/14/19.
//  Copyright © 2019 Instabug. All rights reserved.
//

import Foundation
struct Movies : Codable {
	let page : Int?
	let total_results : Int?
	let total_pages : Int?
	let results : [Results]?

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case total_results = "total_results"
		case total_pages = "total_pages"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		page = try values.decodeIfPresent(Int.self, forKey: .page)
		total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
		total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}

}
