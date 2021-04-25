//
//  Overview.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import Foundation

struct Overview : Codable {

	let title : String?

	enum CodingKeys: String, CodingKey {
		case title = "title"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}


}
