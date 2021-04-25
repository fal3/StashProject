//
//  Achievement.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import Foundation

struct Achievement : Codable {

	let accessible : Bool
	let bgImageUrl : String?
	let id : Int
	let level : String?
	let progress : Int
	let total : Int

    var isValid: Bool {
        return total >= progress && progress >= 0
    }

	enum CodingKeys: String, CodingKey {
		case accessible = "accessible"
		case bgImageUrl = "bg_image_url"
		case id = "id"
		case level = "level"
		case progress = "progress"
		case total = "total"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		accessible = try values.decodeIfPresent(Bool.self, forKey: .accessible) ?? false
		bgImageUrl = try values.decodeIfPresent(String.self, forKey: .bgImageUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
		level = try values.decodeIfPresent(String.self, forKey: .level)
		progress = try values.decodeIfPresent(Int.self, forKey: .progress) ?? 0
		total = try values.decodeIfPresent(Int.self, forKey: .total) ?? 0
	}


}
