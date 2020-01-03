//
//  Family.swift
//  Motivator
//
//  Created by Nikita Nechyporenko on 20.12.2019.
//  Copyright © 2019 Nikita Nechyporenko. All rights reserved.
//

import Foundation

final class Family {
	var name: String?
	var ownerID: String?
	var familyID: String?
	var members: [String]?
	
	init(name: String?, ownerID: String?, familyID: String, members: [String]?) {
		self.name = name
		self.ownerID = ownerID
		self.familyID = familyID
		self.members = members
	}
}
