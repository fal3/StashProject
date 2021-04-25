//
//  Achievements.swift
//  StashProject
//
//  Created by Alexander Fallah on 4/23/21.
//

import Foundation

struct Achievements : Codable {

	let achievements : [Achievement]
	let overview : Overview?
	let status : Int?
	let success : Bool

    var isValid: Bool {
        var seen: Set<String> = []
        return achievements.filter { seen.insert($0.level ?? "").inserted }.count == achievements.count
        //additionally we can do hashing
    }
    
	enum CodingKeys: String, CodingKey {
		case achievements = "achievements"
		case overview
		case status = "status"
		case success = "success"
	}
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		achievements = try values.decodeIfPresent([Achievement].self, forKey: .achievements) ?? []
		overview = try Overview(from: decoder)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		success = try values.decodeIfPresent(Bool.self, forKey: .success) ?? false
	}


}
